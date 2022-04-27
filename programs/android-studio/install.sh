#!/bin/bash

# https://developer.android.com/studio#downloads
base="https://redirector.gvt1.com/edgedl/android/studio/ide-zips"
version="2021.1.1.23"
file="android-studio-$version-linux.tar.gz"

sudo apt install \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  lib32z1 \
  libbz2-1.0:i386

cd ~/Downloads
wget "$base/$version/$file"
tar xvf "$file"
sudo cp -r android-studio /opt

cd /opt/android-studio/
./studio.sh
