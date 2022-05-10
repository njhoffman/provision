#!/bin/bash

# i3-gaps
# https://github.com/Airblader/i3

apt install -y \
  autoconf \
  libev-dev \
  libpango1.0-dev \
  libstartup-notification0-dev \
  libxcb-cursor-dev \
  libxcb-icccm4-dev \
  libxcb-keysyms1-dev \
  libxcb-randr0-dev \
  libxcb-shape0-dev \
  libxcb-util0-dev \
  libxcb-xinerama0-dev \
  libxcb-xkb-dev \
  libxcb1-dev \
  libxkbcommon-dev \
  libxkbcommon-x11-dev \
  libyajl-dev \
  xutils-dev

cd /usr/local/src
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
make install

cd /usr/local/src
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
make install

cd /usr/local/src/
git clone https://github.com/tryone144/compton
cd compton
make
make docs
make install
