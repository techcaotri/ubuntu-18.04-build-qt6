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
# Need some gnu libraries, e.g. #include <charconv>
sudo apt install gcc-11 g++-11 -y

# Install the most recent harfbuzz, freetype, and fontconfig
sudo add-apt-repository ppa:savoury1/backports
sudo apt install libharfbuzz-dev libfreetype-dev fontconfig -y

# Install latest cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get install cmake -y

# Install node 14.x for building QtWebEngine
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install -y gperf bison flex ninja-build

# Install dependencies for 3D rendering
sudo apt-get install -y libxi-dev libxmu-dev libgl1-mesa-dev libglu1-mesa-dev xorg-dev freeglut3-dev mesa-common-dev

# Install dependencies for DBus
sudo apt-get install -y dbus libdbus-1-dev dbus-x11

# Install dependencies for GTK+
sudo apt-get install -y libgtk-3-dev

# Install dependencies for PulseAudio
sudo apt-get install -y pulseaudio libpulse-dev

# Install dependencies for image formats and utilities
sudo apt-get install -y libpng-dev libudev-dev libinput-dev libts-dev libmysqlclient-dev 

# Install GStreamer dependepencies
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 \
  gstreamer1.0-qt5 gstreamer1.0-pulseaudio gstreamer1.0-vaapi

# Install video/audio codecs 
sudo apt-get install -y libva-dev libopus-dev libmp3lame-dev libfdk-aac-dev libvpx-dev libx264-dev libwebp-dev yasm libass-dev libtheora-dev libvorbis-dev

# Install ffmpeg 4.x
sudo add-apt-repository ppa:jonathonf/ffmpeg-4
sudo apt-get install -y libavcodec-dev libavformat-dev libavdevice-dev libavutil-dev libavresample-dev libavfilter-dev libswscale-dev libswresample-dev libpostproc-dev ffmpeg

# Install libjasper
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt install -y libjasper-dev libjasper1

# Install the remaining dependencies
sudo apt install -y libfontconfig1-dev libfreetype6-dev libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev \
  libxi-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev \
  libxcb-icccm4-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
  libxcb-util-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  libxcb-glx0 libxcb-glx0-dev libsm-dev libsm6 libcups2-dev libnss3-dev python3-html5lib libminizip-dev