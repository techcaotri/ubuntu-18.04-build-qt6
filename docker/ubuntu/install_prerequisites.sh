#!/bin/bash -x

sudo echo "Get the sudo password for later usage..."
# Install clang-12
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 12
sudo apt update
sudo apt install clang-12 libclang-12-dev lldb-12 lld-12 -y

# Install the most recent harfbuzz, freetype, and fontconfig
sudo add-apt-repository ppa:savoury1/backports
sudo apt install libharfbuzz-dev libfreetype-dev fontconfig -y

# Install latest cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get install cmake -y

# Install the remaining dependencies
sudo apt install -y libfontconfig1-dev libfreetype6-dev libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev \
  libxi-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev \
  libxcb-icccm4-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
  libxcb-util-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  libxcb-glx0 libxcb-glx0-dev libsm-dev libsm6 libcups2-dev libnss3-dev