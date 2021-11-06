# Install script for directory: C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/backend

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/wtdbosqlite3d.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbosqlite3.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbosqlite3.cmake"
         "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/CMakeFiles/Export/lib/cmake/wt/wt-target-dbosqlite3.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbosqlite3-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbosqlite3.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/CMakeFiles/Export/lib/cmake/wt/wt-target-dbosqlite3.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/CMakeFiles/Export/lib/cmake/wt/wt-target-dbosqlite3-debug.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/wtdbomssqlserverd.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbomssqlserver.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbomssqlserver.cmake"
         "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/CMakeFiles/Export/lib/cmake/wt/wt-target-dbomssqlserver.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbomssqlserver-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/wt/wt-target-dbomssqlserver.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/CMakeFiles/Export/lib/cmake/wt/wt-target-dbomssqlserver.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/wt" TYPE FILE FILES "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/out/build/x64-Debug (par défaut)/src/Wt/Dbo/backend/CMakeFiles/Export/lib/cmake/wt/wt-target-dbomssqlserver-debug.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Dbo/backend" TYPE FILE FILES
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/backend/Sqlite3.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/backend/WDboSqlite3DllDefs.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Dbo/backend" TYPE FILE FILES
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/backend/MSSQLServer.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Dbo/backend/WDboMSSQLServerDllDefs.h"
    )
endif()

