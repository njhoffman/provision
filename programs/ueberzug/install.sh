#!/bin/bash

sudo apt install libvips-dev libsixel-dev libchafa-dev libtbb-dev libxcbres0-dev
#  python3-opencv python3-opencv-apps

mkdir -p "$HOME/.local/src " && cd "$HOME/.local/src" || return
rm -rfv ueberzugpp
git clone https://github.com/jstkdng/ueberzugpp.git && cd ueberzugpp || return
mkdir build && cd build || return
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_OPENCV=OFF ..
cmake --build .

# cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_X11=OFF -DENABLE_OPENCV=OFF
# ENABLE_OPENCV (ON by default)
# ENABLE_X11 (ON by default)
# ENABLE_TURBOBASE64 (OFF by default)
# ENABLE_WAYLAND (OFF by default)
