#
# Copyright 2016-2019 CNRS-UM LIRMM, CNRS-AIST JRL
#

cmake_minimum_required(VERSION 3.1)

set(PROJECT_NAME mc_openrtm)
set(PROJECT_DESCRIPTION mc_openrtm)
set(PROJECT_VERSION 1.3.1)
set(PROJECT_URL https://github.com/jrl-umi3218/mc_openrtm)
set(PROJECT_DEBUG_POSTFIX "_d")
set(PROJECT_USE_KEYWORD_LINK_LIBRARIES True)

set(DOXYGEN_USE_MATHJAX "YES")
option(INSTALL_DOCUMENTATION OFF)
option(INSTALL_GENERATED_HEADERS OFF)
option(INSTALL_PKG_CONFIG_FILE OFF)

set(CXX_DISABLE_WERROR 1)
set(CMAKE_CXX_STANDARD 11)

include(cmake/base.cmake)
include(cmake/idl.cmake)
include(cmake/pkg-config.cmake)

project(${PROJECT_NAME} CXX)

# Dependencies
find_package(mc_rtc REQUIRED)
add_required_dependency(hrpsys-base)

execute_process(
  COMMAND python3 -c "from distutils import sysconfig; print(sysconfig.get_config_var(\"VERSION\"))"
  OUTPUT_VARIABLE PYTHON_VERSION
  RESULT_VARIABLE PYTHON_VERSION_SUCCESS
  OUTPUT_STRIP_TRAILING_WHITESPACE)

omniidl_include_directories("idl")
add_subdirectory(idl)

add_subdirectory(projects)
add_subdirectory(src)
