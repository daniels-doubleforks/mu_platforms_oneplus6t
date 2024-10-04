wget http://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/aarch64-linux-gnu/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz
xz -d gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz
tar xvf gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar
export PATH="$PATH:~/mu_platforms_oneplus6t/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin"
sudo update-alternatives --install /usr/bin/gcc gcc ~/mu_platforms_oneplus6t/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc 70
sudo update-alternatives --install /usr/bin/gcc-ar gcc-ar ~/mu_platforms_oneplus6t/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc-ar 70
cd ..
mkdir venv
python3 -m venv BuildMuVenv
source BuildMuVenv/bin/activate
cd mu_platforms_oneplus6t
pip install --upgrade -r pip-requirements.txt






