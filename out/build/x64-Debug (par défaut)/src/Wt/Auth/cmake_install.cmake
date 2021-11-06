# Install script for directory: C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/install/x64-Debug (par défaut)")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Auth/Dbo/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Auth" TYPE FILE FILES
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/AbstractPasswordService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/AbstractUserDatabase.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/AuthModel.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/AuthService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/AuthUtils.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/AuthWidget.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/FacebookService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/FormBaseModel.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/GoogleService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/HashFunction.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/Identity.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/IssuedToken.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/Login.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/LostPasswordWidget.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OAuthAuthorizationEndpointProcess.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OAuthClient.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OAuthService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OAuthTokenEndpoint.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OAuthWidget.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OidcService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/OidcUserInfoEndpoint.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/PasswordHash.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/PasswordPromptDialog.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/PasswordService.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/PasswordStrengthValidator.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/PasswordVerifier.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/RegistrationModel.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/RegistrationWidget.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/Token.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/UpdatePasswordWidget.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/User.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Auth/WAuthGlobal.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Auth" TYPE FILE FILES
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Auth" TYPE FILE FILES
    )
endif()

