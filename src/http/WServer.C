// This may look like C code, but it's really -*- C++ -*-
/*
 * Copyright (C) 2008 Emweb bv, Herent, Belgium.
 *
 * See the LICENSE file for terms of use.
 */
#include "Wt/WIOService.h"
#include "Wt/WServer.h"

#include <iostream>
#include <string>

#include "Connection.h"
#include "Server.h"
#include "Configuration.h"
#include "../web/Configuration.h"
#include "WebController.h"

#if !defined(WT_WIN32)
#include <signal.h>
#endif

#if defined(WT_WIN32)
#include <process.h>
#endif

#ifdef ANDROID
#include "Android.h"
#endif

#include "uws/App.h"
#include "StaticReply.h"
#include <boost/asio.hpp>

#include "uWSRequest.h"
#include "uWSStockReply.h"
#include "uWebSocket.h"

#include <Wt/WResource.h>

namespace {
  struct PartialArgParseResult {
    std::string wtConfigXml;
    std::string appRoot;
  };

  static PartialArgParseResult parseArgsPartially(const std::string &applicationPath,
                                                  const std::vector<std::string> &args,
                                                  const std::string &configurationFile)
  {
    std::string wt_config_xml;
    Wt::WLogger stderrLogger;
    stderrLogger.setStream(std::cerr);

    http::server::Configuration serverConfiguration(stderrLogger, true);
    serverConfiguration.setOptions(applicationPath, args, configurationFile);

    return PartialArgParseResult {
      serverConfiguration.configPath(),
      serverConfiguration.appRoot()
    };
  }
}
    // struct PerSocketData {
    //     /* Define your user data */
    //     int something;
    // };
namespace Wt {

LOGGER("WServer/wthttp");

struct WServer::Impl
{
  Impl()
    : serverConfiguration_(0),
      server_(0)
  {
#ifdef ANDROID
    preventRemoveOfSymbolsDuringLinking();
#endif
  }

  ~Impl()
  {
    delete serverConfiguration_;
  }

  http::server::Configuration *serverConfiguration_;
  http::server::Server        *server_;
};

WServer::WServer(const std::string& applicationPath,
		 const std::string& wtConfigurationFile)
  : impl_(new Impl())
{ 
  init(applicationPath, wtConfigurationFile);
}

WServer::WServer(int argc, char *argv[], const std::string& wtConfigurationFile)
  : impl_(new Impl())
{
  init(argv[0], "");

  setServerConfiguration(argc, argv, wtConfigurationFile);
}

WServer::WServer(const std::string &applicationPath,
                 const std::vector<std::string> &args,
                 const std::string &wtConfigurationFile)
  : impl_(new Impl())
{
  init(applicationPath, "");

  setServerConfiguration(applicationPath, args, wtConfigurationFile);
}

WServer::~WServer()
{
  if (impl_->server_) {
    try {
      stop();
    } catch (...) {
      LOG_ERROR("~WServer: oops, stop() threw exception!");
    }
  }

  delete impl_;

  destroy();
}

void WServer::setServerConfiguration(int argc, char *argv[],
				     const std::string& serverConfigurationFile)
{
  std::string applicationPath = argv[0];
  std::vector<std::string> args(argv + 1, argv + argc);

  setServerConfiguration(applicationPath, args, serverConfigurationFile);
}

void WServer::setServerConfiguration(const std::string &applicationPath,
                                     const std::vector<std::string> &args,
                                     const std::string &serverConfigurationFile)
{
  auto result = parseArgsPartially(applicationPath, args, serverConfigurationFile);

  if (!result.appRoot.empty())
    setAppRoot(result.appRoot);

  if (configurationFile().empty())
    setConfiguration(result.wtConfigXml);

  webController_ = new Wt::WebController(*this);

  impl_->serverConfiguration_ = new http::server::Configuration(logger());

  impl_->serverConfiguration_->setSslPasswordCallback(sslPasswordCallback_);

  impl_->serverConfiguration_->setOptions(applicationPath, args, serverConfigurationFile);

  configuration().setDefaultEntryPoint(impl_->serverConfiguration_
                                       ->deployPath());
}

bool WServer::start()
{
  setCatchSignals(!impl_->serverConfiguration_->gdb());

  stopCallback_ = std::bind(&WServer::stop, this);

  if (isRunning())
  {
    LOG_ERROR("start(): server already started!");
    return false;
  }

  LOG_INFO("initializing built-in wthttpd");

#ifndef WT_WIN32
  srand48(getpid());
#endif

  // Override configuration settings
  configuration().setRunDirectory(std::string());

  configuration().setUseSlashExceptionForInternalPaths(impl_->serverConfiguration_->defaultStatic());

  if (!impl_->serverConfiguration_->sessionIdPrefix().empty())
    configuration().setSessionIdPrefix(impl_->serverConfiguration_
                                           ->sessionIdPrefix());

  if (impl_->serverConfiguration_->threads() != -1)
    configuration().setNumThreads(impl_->serverConfiguration_->threads());

  if (impl_->serverConfiguration_->parentPort() != -1)
  {
    configuration().setBehindReverseProxy(false);
    configuration().setOriginalIPHeader("X-Forwarded-For");
    configuration().setTrustedProxies({Configuration::Network::fromString("127.0.0.1"),
                                       Configuration::Network::fromString("::1")});
    dedicatedProcessEnabled_ = true;
  }

  try
  {
    // impl_->server_ = new http::server::Server(*impl_->serverConfiguration_,
    //                                           *this);

#ifndef WT_THREADED
    LOG_WARN("No thread support, running in main thread.");
#endif // WT_THREADED

    webController_->start();
    auto config = impl_->serverConfiguration_;
    std::cout << " listening on http://[" <<  config->httpAddress() << "]:" << std::stoi(config->httpPort()) << std::endl;
    

    

    auto streply = new http::server::uWSStockReply(*config);

    std::vector<std::thread *> threads(64);

    std::transform(threads.begin(), threads.end(), threads.begin(), [this, config, streply](std::thread * /*t*/)
                   {
                     return new std::thread([this, config, streply]()
                                            {
                                              auto app = ::uWS::App();

                                              auto loop = uWS::Loop::get();
                                              loop->setThreadId(std::this_thread::get_id());

                                              auto entrypoints = configuration().entryPoints_;

                                              for (auto &ep : entrypoints)
                                              {
                                                //std::cerr << "entry point :" << ep.path().data() << std::endl;
                                                app.get(ep.path().data(), [this, config, streply, &ep](auto *res, auto *req)
                                                        {
                                                          // std::cerr << "entry get :" << req->getMethod() << std::endl;
                                                          
                                                          // std::cerr << "entry get getParameter :" << req->getParameter(0) << std::endl;
                                                          //http::server::uWSRequest *wtreq = new http::server::uWSRequest(res, req, config, &ep);

                                                          //std::cerr << "entry get getQuery :" << wtreq << std::endl;
                                                          auto httpResponseData = res->getHttpResponseData();
                                                          if(!httpResponseData->uwsRequest_){
                                                            httpResponseData->uwsRequest_.reset(new http::server::uWSRequest(res, req, config, &ep, uWS::Loop::get()));
                                                            //std::cerr << "entry get getQuery :" << httpResponseData->uwsRequest_ << std::endl;
                                                          }

                                                          auto wtreq = httpResponseData->uwsRequest_.get();
                                                          wtreq->reset(res, req, &ep);

                                                          this->webController_->handleRequest(wtreq);
                                                          //ep.resource()->handle(wtreq, (WebResponse *)wtreq);
                                                          //wtreq.send(); 

                                                          res->onAborted([=](){
                                                            //std::cerr << "---------GET ABORTED------- " << req << std::endl;
                                                          });

                                                          // res->onWritable([=](int cc){
                                                          //   //std::cerr << "---------GET onWritable------- " << cc << req << std::endl;
                                                          //   return false;
                                                          // });

                                                          //streply->send(res, http::server::Reply::status_type::not_found);
                                                        });
                                                  app.post(ep.path().data(), [this, config, streply, &ep](auto *res, auto *req)
                                                        {
                                                          auto httpResponseData = res->getHttpResponseData();
                                                          if(!httpResponseData->uwsRequest_){
                                                            httpResponseData->uwsRequest_.reset(new http::server::uWSRequest(res, req, config, &ep, uWS::Loop::get()));
                                                          }
                                                          auto wtreq = httpResponseData->uwsRequest_.get();
                                                          wtreq->reset(res, req, &ep);
                                                          //auto wtreq = new http::server::uWSRequest(res, req, config, &ep);
 

                                                          res->onData([=, &ep] (auto message, bool complete) {
                                                              //std::cout << "onData content-type header: " << req->getHeader("content-type") << " - " << contenttype << std::endl;;
                                                              //std::cerr << "---------onData------- " << complete << std::endl << std::endl;
                                                              auto httpResponseData = res->getHttpResponseData();
                                                              if(!httpResponseData->uwsRequest_){
                                                                httpResponseData->uwsRequest_.reset(new http::server::uWSRequest(res, req, config, &ep, uWS::Loop::get()));
                                                              }
                                                              auto wtreq = httpResponseData->uwsRequest_.get();
                                                              
                                                              if(complete) {
                                                                //std::cerr << "---------complete------- " << complete << std::endl << std::endl;
                                                                wtreq->setmessage(message);
                                                                this->webController_->handleRequest(wtreq);
                                                              }
                                                              else
                                                              {
                                                                wtreq->saveRequest();
                                                              }
                                                                

                                                              //http::server::uWSRequest wtreq(res, req, config, &ep);
                                                              //wtreq.setmessage(message);
                                                              //this->webController_->handleRequest(&wtreq);
                                                              //wtreq.send();

                                                          });
std::cerr << "---------rest post------- " << std::endl << std::endl;


                                                          res->onAborted([=](){
                                                            std::cerr << "---------POST ABORTED-------" << std::endl;
                                                          });
                                                                //streply->send(res, http::server::Reply::status_type::not_found);
                                                  });
                                                  if(ep.type() != Wt::EntryPointType::StaticResource)
                                                  {
                                                      app.ws<PerSocketData>(ep.path().data(), {
                                                      /* Settings */
                                                      .compression = uWS::SHARED_COMPRESSOR,
                                                      .maxPayloadLength = 16 * 1024,
                                                      .idleTimeout = 10,
                                                      .maxBackpressure = 1 * 1024 * 1024,
                                                      /* Handlers */
                                                      .upgrade = [this, config, streply, &ep](auto *res, auto *req, auto *context) {

                                                          /* HttpRequest (req) is only valid in this very callback, so we must COPY the headers
                                                          * we need later on while upgrading to WebSocket. You must not access req after first return.
                                                          * Here we create a heap allocated struct holding everything we will need later on. */
                                                          std::cout << "ws socket was open!" << std::endl;
                                                          auto webresponse = new http::server::uWebSocket(res, req, config, &ep, uWS::Loop::get());
                                                          this->webController_->handleRequest(webresponse);

                                                          struct UpgradeData {
                                                              std::string secWebSocketKey;
                                                              std::string secWebSocketProtocol;
                                                              std::string secWebSocketExtensions;
                                                              struct us_socket_context_t *context;
                                                              decltype(res) httpRes;
                                                              bool aborted = false;
                                                          } *upgradeData = new UpgradeData {
                                                              std::string(req->getHeader("sec-websocket-key")),
                                                              std::string(req->getHeader("sec-websocket-protocol")),
                                                              std::string(req->getHeader("sec-websocket-extensions")),
                                                              context,
                                                              res
                                                          };

                                                          /* We have to attach an abort handler for us to be aware
                                                          * of disconnections while we perform async tasks */
                                                          res->onAborted([=]() {
                                                              /* We don't implement any kind of cancellation here,
                                                              * so simply flag us as aborted */
                                                              upgradeData->aborted = true;
                                                              std::cout << "HTTP socket was closed before we upgraded it!" << std::endl;
                                                          });


                                                          upgradeData->httpRes->template upgrade<PerSocketData>({
                                                                      /* We initialize PerSocketData struct here */
                                                                      .something = 13,
                                                                      .webresponse = webresponse
                                                                  },  upgradeData->secWebSocketKey,
                                                                      upgradeData->secWebSocketProtocol,
                                                                      upgradeData->secWebSocketExtensions,
                                                                      upgradeData->context);


                                                      },
                                                      .open = [](auto *ws) {
                                                          /* Open event here, you may access ws->getUserData() which points to a PerSocketData struct.
                                                          * Here we simply validate that indeed, something == 13 as set in upgrade handler. */
                                                          auto wsdata = static_cast<PerSocketData *>(ws->getUserData());
                                                          //std::cout << "Something is: " << wsdata->something << std::endl;
                                                          wsdata->webresponse->reset(ws);
                                                      },
                                                      .message = [this, config, streply, &ep](auto *ws, std::string_view message, uWS::OpCode opCode) {
                                                          /*  */
                                                          //std::cout << "message, opCode: " << message << " - " << opCode << std::endl;
                                                          auto wsdata = static_cast<PerSocketData *>(ws->getUserData());
                                                          if(wsdata->webresponse)
                                                          {
                                                            std::cout << "ws webresponse: " << message << std::endl;
                                                            wsdata->webresponse->consumeWebSocketMessage(opCode, message);
                                                            //wsdata->webresponse = new http::server::uWebSocket(nullptr, nullptr, config, &ep, true);
                                                          }
                                                          //this->webController_->handleRequest(wsdata->webresponse);
                                                          //ws->send("{}", uWS::OpCode::PONG);
                                                      },
                                                      .drain = [](auto */*ws*/) {
                                                          /* Check ws->getBufferedAmount() here */
                                                      },
                                                      .ping = [](auto */*ws*/, std::string_view) {
                                                          /* You don't need to handle this one, we automatically respond to pings as per standard */
                                                      },
                                                      .pong = [](auto */*ws*/, std::string_view) {
                                                          /* You don't need to handle this one either */
                                                      },
                                                      .close = [](auto */*ws*/, int /*code*/, std::string_view /*message*/) {
                                                          /* You may access ws->getUserData() here, but sending or
                                                          * doing any kind of I/O with the socket is not valid. */
                                                      }});
                                                  }
                                              }

                                              app.get("/*", [this, config, streply](auto *res, auto *req)
                                                      {
                                                        //auto streponse = streply->get(http::server::Reply::status_type::not_found);
                                                        // req->lastStaticReply_.reset(new http::server::StaticReply(req, *this->impl_->serverConfiguration_));
                                                        // std::cerr << "test cdc " << req->lastWtReply_ << std::endl;

                                                        // boost::asio::buffer dc;
                                                        streply->send(res, http::server::Reply::status_type::not_found);
                                                        //  res->writeHeader("Content-Type", "text")
                                                        //      ->writeHeader("Server", "Wt")
                                                        //      ->end(streponse);
                                                        //this->impl_->server_->request_handler_.handleRequest(req, )
                                                        //res->end("");
                                                      });
                                              app.listen(config->httpAddress(), std::stoi(config->httpPort()), [](auto *listen_socket)
                                                        {
                                                          if (listen_socket)
                                                          {
                                                            /* Note that us_listen_socket_t is castable to us_socket_t */
                                                            //std::cout << "Thread " << std::this_thread::get_id() << " listening on http://127.0.0.1:" << us_socket_local_port(false, (struct us_socket_t *)listen_socket) << std::endl;
                                                          }
                                                          else
                                                          {
                                                            //std::cout << "Thread " << std::this_thread::get_id() << " failed to listen on port 3000" << std::endl;
                                                          }
                                                        })
                                                .run();
                                              });
                   });

    std::for_each(threads.begin(), threads.end(), [](std::thread *t)
                  { t->join(); });

    //std::cout << "asio ioservice backend " << std::endl;
    //ioService().start();

#ifndef WT_THREADED
    delete impl_->server_;
    impl_->server_ = 0;

    //ioService().stop();

    return false;
#else
    return true;
#endif // WT_THREADED
  }
  catch (Wt::AsioWrapper::system_error &e)
  {
    throw Exception(std::string("Error (asio): ") + e.what());
  }
  catch (std::exception &e)
  {
    throw Exception(std::string("Error: ") + e.what());
  }
}

bool WServer::isRunning() const
{
  return impl_->server_;
}

void WServer::resume()
{
  if (!isRunning()) {
    LOG_ERROR("resume(): server not yet started!");
    return;
  } else {
    impl_->server_->resume();    
  }
}

void WServer::stop()
{
  if (!isRunning()) {
    LOG_ERROR("stop(): server not yet started!");
    return;
  }

#ifdef WT_THREADED
  try {
    // Stop the Wt application server (cleaning up all sessions).
    webController_->shutdown();

    LOG_INFO("Shutdown: stopping web server.");

    // Stop the server.
    impl_->server_->stop();

    ioService().stop();

    delete impl_->server_;
    impl_->server_ = 0;
  } catch (Wt::AsioWrapper::system_error& e) {
    throw Exception(std::string("Error (asio): ") + e.what());
  } catch (std::exception& e) {
    throw Exception(std::string("Error: ") + e.what());
  }

#else // WT_THREADED
  webController_->shutdown();
  impl_->server_->stop();
  ioService().stop();
#endif // WT_THREADED
}

void WServer::run()
{
  if (start()) {
    waitForShutdown();
    stop();
  }
}

int WServer::httpPort() const
{
  return impl_->server_->httpPort();
}

std::vector<WServer::SessionInfo> WServer::sessions() const
{
  if (configuration_->sessionPolicy() == Wt::Configuration::DedicatedProcess &&
      impl_->serverConfiguration_->parentPort() == -1)
  {
    return impl_->server_->sessionManager()->sessions();
  }
  else
  {
#ifndef WT_WIN32
    int64_t pid = getpid();
#else  // WT_WIN32
    int64_t pid = _getpid();
#endif // WT_WIN32
    std::vector<std::string> sessionIds = webController_->sessions();
    std::vector<WServer::SessionInfo> result;
    for (std::size_t i = 0; i < sessionIds.size(); ++i)
    {
      SessionInfo sessionInfo;
      sessionInfo.processId = pid;
      sessionInfo.sessionId = sessionIds[i];
      result.push_back(sessionInfo);
    }
    return result;
  }
}

void WServer::setSslPasswordCallback(const SslPasswordCallback& cb)
{
  sslPasswordCallback_ = cb;

  if (impl_ && impl_->serverConfiguration_)
    impl_->serverConfiguration_->setSslPasswordCallback(sslPasswordCallback_);
}

int WRun(int argc, char *argv[], ApplicationCreator createApplication)
{
  std::string applicationPath = argv[0];
  std::vector<std::string> args(argv + 1, argv + argc);

  return WRun(applicationPath, args, createApplication);
}

int WRun(const std::string &applicationPath,
         const std::vector<std::string> &args,
         ApplicationCreator createApplication)
{
  try {
    WServer server(applicationPath, "");
    try {
      server.setServerConfiguration(applicationPath, args, WTHTTP_CONFIGURATION);
      server.addEntryPoint(EntryPointType::Application, createApplication);
      if (server.start()) {
#ifdef WT_THREADED
        // MacOSX + valgrind:
        // for (;;) { sleep(100); }
        int sig = WServer::waitForShutdown();
        LOG_INFO_S(&server, "shutdown (signal = " << sig << ")");
#endif
        server.stop();

#ifdef WT_THREADED
#ifndef WT_WIN32
        if (sig == SIGHUP)
          // Mac OSX: _NSGetEnviron()
          WServer::restart(applicationPath, args);
#endif // WIN32
#endif // WT_THREADED
      }

      return 0;
    } catch (std::exception& e) {
      LOG_INFO_S(&server, "fatal: " << e.what());
      return 1;
    }
  } catch (Wt::WServer::Exception& e) {
    LOG_ERROR("fatal: " << e.what());
    return 1;
  } catch (std::exception& e) {
    LOG_ERROR("fatal exception: " << e.what());
    return 1;
  }
}

}
