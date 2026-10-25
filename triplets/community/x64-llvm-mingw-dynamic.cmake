include("${VCPKG_ROOT_DIR}/triplets/community/x64-mingw-dynamic.cmake")

set(ENV{CUSTOM_VCPKG_ROOT_DIR} ${VCPKG_ROOT_DIR})

list(APPEND VCPKG_ENV_PASSTHROUGH_UNTRACKED "LLVM_MINGW_ROOT;CUSTOM_VCPKG_ROOT_DIR")

set(_llvm_mingw_toolchain "${CMAKE_CURRENT_LIST_DIR}/../../scripts/toolchains/llvm-mingw.cmake")
if(NOT EXISTS "${_llvm_mingw_toolchain}")
    message(FATAL_ERROR "llvm-mingw toolchain not found (checked ../../scripts/toolchains)")
endif()

set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${_llvm_mingw_toolchain}")
