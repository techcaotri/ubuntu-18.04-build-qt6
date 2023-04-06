#!/bin/bash -x
patch qt-everywhere-src-6.4.3/qtmultimedia/src/plugins/multimedia/ffmpeg/qv4l2camera.cpp qv4l2camera_patch.patch 
pushd .
cd qt-everywhere-src-6.4.3
mkdir -p build && cd build
../configure -shared \
  -prefix ../Qt_6.4.3_install \
  -opensource -confirm-license -opengl \
  -nomake examples -nomake tests \
  -skip qtserialbus -skip qtserialport \
  -bundled-xcb-xinput -release -qt-libpng -system-zlib -qt-pcre -libinput -fontconfig -system-freetype -system-harfbuzz \
  -xcb-xlib -xcb -- -DCMAKE_C_COMPILER:STRING=/usr/bin/clang-12 -DCMAKE_CXX_COMPILER:STRING=/usr/bin/clang++-12 2>&1 | tee configure.log

cmake --build . --parallel $((`nproc`-2)) --verbose 2>&1 | tee build.log
cmake --install . --prefix ../Qt_6.4.3_install -v 2>&1 | tee install.log
popd
