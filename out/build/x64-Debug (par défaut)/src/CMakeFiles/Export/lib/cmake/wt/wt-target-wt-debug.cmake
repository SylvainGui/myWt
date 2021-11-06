#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Wt::Wt" for configuration "Debug"
set_property(TARGET Wt::Wt APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Wt::Wt PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C;CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/wtd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Wt::Wt )
list(APPEND _IMPORT_CHECK_FILES_FOR_Wt::Wt "${_IMPORT_PREFIX}/lib/wtd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
