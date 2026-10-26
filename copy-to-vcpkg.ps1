param(
    [string]$VcpkgRoot = $env:VCPKG_ROOT
)

$ErrorActionPreference = 'Stop'

if (-not $VcpkgRoot) {
    throw 'VCPKG_ROOT is not set.'
}

$copyTriplets = @{
    Path        = "$PSScriptRoot\triplets\community\*.cmake"
    Destination = "$VcpkgRoot\triplets\community\"
    Force       = $true
}
Copy-Item @copyTriplets

$copyToolchains = @{
    Path        = "$PSScriptRoot\scripts\toolchains\*.cmake"
    Destination = "$VcpkgRoot\scripts\toolchains\"
    Force       = $true
}
Copy-Item @copyToolchains

Write-Host "synced to $VcpkgRoot"
