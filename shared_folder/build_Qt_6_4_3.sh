#!/bin/bash -x
pushd .
cd qt-everywhere-src-6.4.3

./configure -shared \
  -prefix /home/tripham/Dev/Qt_src/Qt_6.4.3_install \
  -opensource -confirm-license -no-opengl \
  -nomake examples -nomake tests \
  -skip qtserialbus -skip qtserialport \
  -bundled-xcb-xinput -release -qt-libpng -system-zlib -qt-pcre -libinput -fontconfig -system-freetype -system-harfbuzz \
  -xcb-xlib -xcb -- -DCMAKE_C_COMPILER:STRING=/usr/bin/clang-12 -DCMAKE_CXX_COMPILER:STRING=/usr/bin/clang++-12 2>&1 | tee configure.log

cmake --build . --parallel $((`nproc`-2)) -verbose 2>&1 | tee build.log
cmake --install . --prefix /home/tripham/Dev/Qt_src/Qt_6.4.3_install -v 2>&1 | tee install.log
popd
