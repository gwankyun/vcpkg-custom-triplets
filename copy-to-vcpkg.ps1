param(
    [string]$VcpkgRoot = $env:VCPKG_ROOT
)

$ErrorActionPreference = 'Stop'

if (-not $VcpkgRoot) {
    throw 'VCPKG_ROOT is not set.'
}

Copy-Item -Path "$PSScriptRoot\triplets\*.cmake" -Destination "$VcpkgRoot\triplets\community\" -Force
Copy-Item -Path "$PSScriptRoot\toolchains\llvm-mingw.cmake" -Destination "$VcpkgRoot\scripts\toolchains\" -Force

Write-Host "synced to $VcpkgRoot"
