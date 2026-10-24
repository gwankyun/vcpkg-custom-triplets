include("${CMAKE_CURRENT_LIST_DIR}/../../scripts/toolchains/mingw.cmake")

if("$ENV{LLVM_MINGW_ROOT}" STREQUAL "")
    message(FATAL_ERROR "LLVM_MINGW_ROOT is not set")
endif()

set(_llvm_mingw_bin "$ENV{LLVM_MINGW_ROOT}/bin")

if(NOT EXISTS "${_llvm_mingw_bin}/${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32-clang.exe")
    message(FATAL_ERROR "Not a valid llvm-mingw installation: $ENV{LLVM_MINGW_ROOT} (missing ${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32-clang.exe)")
endif()

set(CMAKE_C_COMPILER   "${_llvm_mingw_bin}/clang.exe"     CACHE FILEPATH "" FORCE)
set(CMAKE_CXX_COMPILER "${_llvm_mingw_bin}/clang++.exe"   CACHE FILEPATH "" FORCE)
set(CMAKE_RC_COMPILER  "${_llvm_mingw_bin}/${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32-windres.exe"
    CACHE FILEPATH "" FORCE)
set(CMAKE_AR           "${_llvm_mingw_bin}/llvm-ar.exe"     CACHE FILEPATH "" FORCE)
set(CMAKE_RANLIB       "${_llvm_mingw_bin}/llvm-ranlib.exe" CACHE FILEPATH "" FORCE)
