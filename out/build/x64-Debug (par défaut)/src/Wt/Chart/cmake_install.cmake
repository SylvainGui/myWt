# Install script for directory: C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Wt/Chart" TYPE FILE FILES
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAbstractChart.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAbstractChartImplementation.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAbstractChartModel.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAbstractColorMap.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAbstractDataSeries3D.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAbstractGridData.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAxis.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WAxisSliderWidget.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WCartesian3DChart.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WCartesianChart.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WChart2DImplementation.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WChart3DImplementation.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WChartGlobal.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WChartPalette.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WDataSeries.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WEquidistantGridData.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WGridData.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WLegend.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WLegend3D.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WPieChart.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WScatterData.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WSelection.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WStandardChartProxyModel.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WStandardColorMap.h"
    "C:/Users/gsylv/Desktop/wt-4.5.0-rc1/src/Wt/Chart/WStandardPalette.h"
    )
endif()

