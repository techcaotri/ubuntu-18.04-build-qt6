#!/bin/bash -x

# This script is used to prepare the Qt6 sources for the docker image.
if [ -d "./qt-everywhere-src-6.4.3" ]; then
  echo "Directory qt-everywhere-src-6.4.3 exists so skip download"
else
  if [ -e "./qt-everywhere-src-6.4.3.tar.xz" ]; then
      echo "File qt-everywhere-src-6.4.3.tar.xz exists"
  else
      wget https://download.qt.io/official_releases/qt/6.4/6.4.3/single/qt-everywhere-src-6.4.3.tar.xz
  fi
  tar xfv qt-everywhere-src-6.4.3.tar.xz
fi

echo "Qt 6.4.3 source code is ready at 'qt-everywhere-src-6.4.3'"