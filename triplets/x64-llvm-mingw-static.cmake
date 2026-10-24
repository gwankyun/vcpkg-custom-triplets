include("${VCPKG_ROOT_DIR}/triplets/community/x64-mingw-static.cmake")

list(APPEND VCPKG_ENV_PASSTHROUGH_UNTRACKED "LLVM_MINGW_ROOT")

set(_llvm_mingw_toolchain "${CMAKE_CURRENT_LIST_DIR}/../toolchains/llvm-mingw.cmake")
if(NOT EXISTS "${_llvm_mingw_toolchain}")
    set(_llvm_mingw_toolchain "${CMAKE_CURRENT_LIST_DIR}/../../scripts/toolchains/llvm-mingw.cmake")
endif()
if(NOT EXISTS "${_llvm_mingw_toolchain}")
    message(FATAL_ERROR "llvm-mingw toolchain not found (checked ../toolchains and ../../scripts/toolchains)")
endif()

set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${_llvm_mingw_toolchain}")
