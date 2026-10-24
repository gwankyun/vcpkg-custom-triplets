set(custom_triplets_path "${CMAKE_CURRENT_LIST_DIR}")

if(NOT EXISTS "${custom_triplets_path}/detail/config.cmake")
  set(custom_triplets_path "C:/local/vcpkg-custom-triplets")
endif()

# 加載配置文件
set(config_path "${custom_triplets_path}/detail/config.cmake")

include("${config_path}")

# 加載vcpkg自帶的x64-mingw-static三元組
if(NOT DEFINED x64_mingw_triplet)
  set(x64_mingw_triplet "x64-mingw-static.cmake")
endif()

set(x64_mingw_triplet "${vcpkg_path}/triplets/community/${x64_mingw_triplet}")
include(${x64_mingw_triplet})

# 設置工具鏈文件路徑
set(toolchains_file_path "${custom_triplets_path}/detail/llvm-mingw.cmake")
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${toolchains_file_path}")
