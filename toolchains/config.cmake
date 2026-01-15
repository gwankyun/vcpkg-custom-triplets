# 配置vcpkg路徑
if(DEFINED ENV{VCPKG_ROOT})
  set(vcpkg_path "$ENV{VCPKG_ROOT}")
else()
  set(vcpkg_path "C:/local/vcpkg")
endif()

# 配置llvm-ming編譯器路徑
if(DEFINED ENV{LLVM_MINGW_ROOT})
  set(llvm_mingw_clang "$ENV{LLVM_MINGW_ROOT}/bin/clang.exe")
  set(llvm_mingw_clangxx "$ENV{LLVM_MINGW_ROOT}/bin/clang++.exe")
else()
  set(llvm_mingw_clang "C:/local/llvm-mingw/bin/clang.exe")
  set(llvm_mingw_clangxx "C:/local/llvm-mingw/bin/clang++.exe")
endif()
