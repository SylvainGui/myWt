# Install script for directory: C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/wtdbod.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbo.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbo.cmake"
         "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/CMakeFiles/Export/lib/cmake/wt/wt-target-dbo.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbo-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbo.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/CMakeFiles/Export/lib/cmake/wt/wt-target-dbo.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/CMakeFiles/Export/lib/cmake/wt/wt-target-dbo-debug.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/Wt/WConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Dbo" TYPE FILE FILES
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Call.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Call_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/collection.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/collection_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/DbAction.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/DbAction_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Dbo.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/EscapeOStream.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Exception.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Field.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Field_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/FixedSqlConnectionPool.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Json.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Logger.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/ptr.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/ptr_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/ptr_tuple.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Query.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/QueryColumn.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/QueryModel.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/QueryModel_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Query_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Session.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Session_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/SqlConnection.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/SqlConnectionPool.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/SqlStatement.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/SqlTraits.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/SqlTraits_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/StdSqlTraits.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/StringStream.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Transaction.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/Types.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/WDboDllDefs.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/weak_ptr.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/weak_ptr_impl.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/WtSqlTraits.h"
    )
endif()

