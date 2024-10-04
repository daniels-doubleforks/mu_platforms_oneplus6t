wget http://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/aarch64-linux-gnu/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz
xz -d gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz
tar xvf gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar
export PATH="$PATH:ToolChain/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin"
sudo update-alternatives --install /usr/bin/gcc gcc ToolChain/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc 70
sudo update-alternatives --install /usr/bin/gcc-ar gcc-ar ToolChain/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc-ar 70
cd ..
mkdir venv
python3 -m venv BuildMuVenv
source BuildMuVenv/bin/activate
cd mu_platforms_oneplus6t
pip install --upgrade -r pip-requirements.txt
stuart_setup -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=VS2019
stuart_update -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=VS2019
stuart_build -c Platforms/OnePlus6TPkg/PlatformCI/PlatformBuild.py TOOL_CHAIN_TAG=VS2019
mkdir img
cp Build/OnePlus6TPkg/DEBUG_VS2019/FV/ONEPLUS6TPKG_UEFI.fd ./img
cp dtb/fajita.dtb ./img
echo > ./img/ramdisk
cd img
gzip -c < ./ONEPLUS6TPKG_UEFI.fd > "./uefi-fajita.img.gz"
cat "./uefi-fajita.img.gz" "./fajita.dtb" > "./uefi-fajita.img.gz-dtb"
abootimg --create "./boot-fajita.img" -k "./uefi-fajita.img.gz-dtb" -r ramdisk







