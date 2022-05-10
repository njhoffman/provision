#!/bin/bash

sudo apt install \
  dh-python \
  intltool \
  libappindicator-dev \
  libdbus-glib-1-dev \
  libnotify-dev \
  libx11-dev \
  python3 \
  python3-future \
  python3-gi

cpan install XML::Parser

ghq get -l osdlyrics/osdlyrics
./autogen.sh
./configure --prefix=/usr PYTHON=/usr/bin/python3
make
sudo make install

# apt repo: https://salsa.debian.org/debian/osdlyrics.git
# dl release: http://archive.ubuntu.com/ubuntu/pool/universe/o/osdlyrics/osdlyrics_0.5.5~rc1+dfsg1-2.debian.tar.xz
