#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Wt::DboSqlite3" for configuration "Debug"
set_property(TARGET Wt::DboSqlite3 APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Wt::DboSqlite3 PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C;CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/wtdbosqlite3d.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Wt::DboSqlite3 )
list(APPEND _IMPORT_CHECK_FILES_FOR_Wt::DboSqlite3 "${_IMPORT_PREFIX}/lib/wtdbosqlite3d.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
