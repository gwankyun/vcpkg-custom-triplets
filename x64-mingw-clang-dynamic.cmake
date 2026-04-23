set(custom_triplets_path "${CMAKE_CURRENT_LIST_DIR}")

if(NOT EXISTS "${custom_triplets_path}/detail/config.cmake")
  set(custom_triplets_path "C:/local/vcpkg-custom-triplets")
endif()

# 加載vcpkg自帶的x64-mingw-dynamic三元組
if(DEFINED x64_mingw_triplet)
  message(FATAL_ERROR "x64_mingw_triplet has been set: ${x64_mingw_triplet}")
endif()

set(x64_mingw_triplet "x64-mingw-dynamic.cmake")

include("${custom_triplets_path}/x64-mingw-clang-static.cmake")
