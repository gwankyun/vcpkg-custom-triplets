# 加載配置文件
if(DEFINED ENV{VCPKG_CUSTOM_TRIPLETS})
  set(config_path "$ENV{VCPKG_CUSTOM_TRIPLETS}/toolchains/config.cmake")
else()
  set(config_path "${CMAKE_CURRENT_LIST_DIR}/toolchains/config.cmake")
endif()

if(NOT EXISTS "${config_path}")
  message(FATAL_ERROR "config.cmake does not exist: ${config_path}")
endif()

include("${config_path}")

# 加載vcpkg自帶的x64-mingw-static三元組
if(NOT DEFINED x64_mingw_triplet)
  set(x64_mingw_triplet "x64-mingw-static.cmake")
endif()

include("${vcpkg_path}/triplets/community/${x64_mingw_triplet}")

# 設置工具鏈文件路徑
set(toolchains_file_path "${CMAKE_CURRENT_LIST_DIR}/toolchains/llvm-mingw.cmake")
message(STATUS "toolchains_file_path: ${toolchains_file_path}")

if(NOT EXISTS "${toolchains_file_path}")
  message(FATAL_ERROR "Toolchain file does not exist: ${toolchains_file_path}")
endif()

set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${toolchains_file_path}")
