cmake_path(SET config_path "${CMAKE_CURRENT_LIST_DIR}")
cmake_path(APPEND config_path "config.cmake")

if(NOT EXISTS "${config_path}")
  message(FATAL_ERROR "config.cmake does not exist: ${config_path}")
endif()

include("${config_path}")

if(NOT DEFINED x64_mingw_triplet)
  set(x64_mingw_triplet "x64-mingw-static.cmake")
endif()

include("${vcpkg_path}/triplets/community/${x64_mingw_triplet}")

set(toolchains_file_path "${CMAKE_CURRENT_LIST_DIR}/toolchains/llvm-mingw.cmake")
message(STATUS "toolchains_file_path: ${toolchains_file_path}")

if(NOT EXISTS "${toolchains_file_path}")
  message(FATAL_ERROR "Toolchain file does not exist: ${toolchains_file_path}")
endif()

set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${toolchains_file_path}")
