cmake_path(SET config_path "${CMAKE_CURRENT_LIST_DIR}")
cmake_path(GET config_path PARENT_PATH config_path)
cmake_path(APPEND config_path "config.cmake")
if(NOT EXISTS "${config_path}")
  message(FATAL_ERROR "config.cmake does not exist: ${config_path}")
endif()
include("${config_path}")

include("${vcpkg_path}/scripts/toolchains/mingw.cmake")

set(CMAKE_C_COMPILER "${llvm_mingw_clang}")
set(CMAKE_CXX_COMPILER "${llvm_mingw_clangxx}")

message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
