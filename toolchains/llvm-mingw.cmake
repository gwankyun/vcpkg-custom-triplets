# 加載配置文件
if(DEFINED ENV{VCPKG_CUSTOM_TRIPLETS})
  set(config_path "$ENV{VCPKG_CUSTOM_TRIPLETS}/toolchains/config.cmake")
else()
  set(config_path "${CMAKE_CURRENT_LIST_DIR}/config.cmake")
endif()

if(NOT EXISTS "${config_path}")
  message(FATAL_ERROR "config.cmake does not exist: ${config_path}")
endif()

include("${config_path}")

# 先加載vcpkg的mingw工具鏈
include("${vcpkg_path}/scripts/toolchains/mingw.cmake")

# 覆蓋vcpkg的mingw工具鏈
set(CMAKE_C_COMPILER "${llvm_mingw_clang}")
set(CMAKE_CXX_COMPILER "${llvm_mingw_clangxx}")

message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
