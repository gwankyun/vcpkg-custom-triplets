# 加載vcpkg自帶的x64-mingw-dynamic三元組
if(NOT DEFINED x64_mingw_triplet)
  set(x64_mingw_triplet "x64-mingw-dynamic.cmake")
else()
  message(FATAL_ERROR "x64_mingw_triplet has been set: ${x64_mingw_triplet}")
endif()

include("${CMAKE_CURRENT_LIST_DIR}/x64-mingw-clang-static.cmake")
