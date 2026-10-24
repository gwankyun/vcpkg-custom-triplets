function(check_file file)
  if(NOT EXISTS "${file}")
    message(FATAL_ERROR "file does not exist: ${file}")
  endif()
endfunction()

# 配置vcpkg路徑
set(vcpkg_path "C:/local/vcpkg")
check_file("${vcpkg_path}")

# 配置llvm-ming編譯器路徑
set(llvm_mingw_bin "C:/local/llvm-mingw/bin")
set(llvm_mingw_clang "${llvm_mingw_bin}/clang.exe")
check_file("${llvm_mingw_clang}")
set(llvm_mingw_clangxx "${llvm_mingw_bin}/clang++.exe")
check_file("${llvm_mingw_clangxx}")