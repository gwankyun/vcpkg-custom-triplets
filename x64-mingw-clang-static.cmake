# 加載配置文件
set(config_path "${CMAKE_CURRENT_LIST_DIR}/detail/config.cmake")

if(NOT EXISTS "${config_path}")
  message(FATAL_ERROR "config_path does not exist: ${config_path}")
endif()

include("${config_path}")

# 加載vcpkg自帶的x64-mingw-static三元組
if(NOT DEFINED x64_mingw_triplet)
  set(x64_mingw_triplet "x64-mingw-static.cmake")
endif()

set(x64_mingw_triplet "${vcpkg_path}/triplets/community/${x64_mingw_triplet}")
check_file("${x64_mingw_triplet}")
include(${x64_mingw_triplet})

# 設置工具鏈文件路徑
set(toolchains_file_path "${CMAKE_CURRENT_LIST_DIR}/detail/llvm-mingw.cmake")
check_file(${toolchains_file_path})
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${toolchains_file_path}")
