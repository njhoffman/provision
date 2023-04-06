#!/bin/bash

# installed version of wx is too old,
# configure: error: Please install development libraries for wxWidgets 2.9.1 or higher, and then run this configure script again.
http://archive.ubuntu.com/ubuntu/pool/universe/g/glee/glee-dev_5.4.0-2_amd64.deb
http://archive.ubuntu.com/ubuntu/pool/universe/g/glee/libglee0d1-dbg_5.4.0-2_amd64.deb
sudo apt install ./libglee0d1_5.4.0-2_amd64.deb
sudo apt install ./glee-dev_5.4.0-2_amd64.deb
sudo dpkg --force-all -i glee-dev_5.4.0-2_amd64.deb
sudo dpkg --force-all -i libglee0d1_5.4.0-2_amd64.deb

sudo apt install libalien-wxwidgets-perl libplplotwxwidgets1 plplot-driver-wxwidgets

sudo apt-get install
subversion \
  autoconf \
  libtool \
  libgtk2.0-dev \
  libgl1-mesa-dev \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev \
  liblua5.1-0-dev \
  libcurl4-openssl-dev \
  libxml2-dev \
  libjpeg8-dev \
  libgtop2-dev \
  libboost-dev \
  libboost-filesystem-dev \
  libboost-thread-dev \
  libtinyxml-dev \
  freeglut3-dev

ghq get l scottdraves/flam3
./configure && make && sudo make install
autoreconf -i -f
./configure && make && sudo make install

cd ./client_generic
ghq get -l scottdraves/electricsheep/wiki/Compiling
./autogen.sh
./configure
make --keep-going
sudo make install
