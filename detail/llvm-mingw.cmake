# 加載配置文件
set(config_path "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

if(NOT EXISTS "${config_path}")
  message(FATAL_ERROR "config.cmake does not exist: ${config_path}")
endif()

include("${config_path}")

# 先加載vcpkg的mingw工具鏈
set(mingw_path "${vcpkg_path}/scripts/toolchains/mingw.cmake")
check_file("${mingw_path}")
include("${mingw_path}")

# 覆蓋vcpkg的mingw工具鏈
set(CMAKE_C_COMPILER "${llvm_mingw_clang}")
set(CMAKE_CXX_COMPILER "${llvm_mingw_clangxx}")

message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
