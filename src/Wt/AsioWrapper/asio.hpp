// This may look like C code, but it's really -*- C++ -*-
/*
 * Copyright (C) 2016 Emweb bv, Herent, Belgium.
 *
 * See the LICENSE file for terms of use.
 */
#ifndef WT_ASIO_ASIO_H_
#define WT_ASIO_ASIO_H_

#include "Wt/WConfig.h"

#ifdef WT_ASIO_IS_BOOST_ASIO

#include <boost/asio.hpp>
// using boost::asio::ip::tcp;
// using boost::asio::awaitable;
// using boost::asio::co_spawn;
// using boost::asio::detached;
// using boost::asio::redirect_error;
// using boost::asio::use_awaitable;
// using boost::asio::use_future;

#else // WT_ASIO_IS_STANDALONE_ASIO

#include <asio.hpp>

#endif // WT_ASIO_IS_BOOST_ASIO

#include "namespace.hpp"

#endif // WT_ASIO_ASIO_H_
