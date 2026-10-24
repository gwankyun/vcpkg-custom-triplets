$community = Join-Path $env:VCPKG_ROOT "triplets\community"

Copy-Item -Path "$PSScriptRoot\vcpkg\*" -Destination $community -Force

$community_triplets = Join-Path $community "vcpkg-custom-triplets"

if (-Not(Test-Path $community_triplets -PathType Container)) {
    New-Item -ItemType SymbolicLink -Path "$community_triplets" -Target "$PSScriptRoot"
}

