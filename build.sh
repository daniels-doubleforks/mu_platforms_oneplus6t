export CLANG38_CC_FLAGS="-Wno-error=unaligned-access -Wunused-but-set-variable"
stuart_setup -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_update -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_build -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
mkdir img
cp Build/OnePlus6TPkg/DEBUG_CLANG38/FV/ONEPLUS6TPKG_UEFI.fd ./img
cp dtb/fajita.dtb ./img
echo > ./img/ramdisk
cd img
gzip -c < ./ONEPLUS6TPKG_UEFI.fd > "./uefi-fajita.img.gz"
cat "./uefi-fajita.img.gz" "./fajita.dtb" > "./uefi-fajita.img.gz-dtb"
abootimg --create "./boot-fajita.img" -k "./uefi-fajita.img.gz-dtb" -r ramdisk
cp boot-fajita.img ../
