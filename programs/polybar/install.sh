#!/bin/bash

sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
sudo apt install libiw-dev libnl-3-dev

mkdir -p ~/.local/src && cd ~/.local/src
git clone git@github.com:polybar/polybar
./build.sh

# mkdir build
# cd build
# cmake ..
# make -j"$(nproc)"
# # Optional. This will install the polybar executable in /usr/local/bin
# sudo make install
