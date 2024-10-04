export CLANG38_CC_FLAGS="-Wno-error=unaligned-access -Wunused-but-set-variable"
stuart_setup -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38||exit 1
stuart_update -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38||exit 1
stuart_build -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38||exit 1
cp Build/OnePlus6TPkg/DEBUG_CLANG38/FV/ONEPLUS6TPKG_UEFI.fd ./img||exit 1
cp dtb/fajita.dtb ./img||exit 1
echo > ./img/ramdisk||exit 1
cd img||exit 1
gzip -c < ./ONEPLUS6TPKG_UEFI.fd > "./uefi-fajita.img.gz"||exit 1
cat "./uefi-fajita.img.gz" "./fajita.dtb" > "./uefi-fajita.img.gz-dtb"||exit 1
abootimg --create "./boot-fajita.img" -k "./uefi-fajita.img.gz-dtb" -r ramdisk||exit 1
cp boot-fajita.img ../||exit 1
