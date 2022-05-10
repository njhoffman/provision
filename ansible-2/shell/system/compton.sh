#!/bin/bash

apt install pkg-config make gcc libev-libevent-dev libdbus-1-dev libgl1-mesa-dev libgles2-mesa-dev libxcb-present-dev libxcb-sync-dev libxcb-damage0-dev libx11-xcb-dev libev4 libev-dev uthash-dev libxdg-basedir-dev libconfig-dev meson libx11-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-shape0-dev libxcb-xkb-dev pkg-config xcb-proto libxcb-xrm-dev libxcb-composite0-dev xcb libxcb-ewmh2 libxcb1-dev libxcb-keysyms1-dev libxcb-util0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxinerama-dev
libxrender-dev
libxcomposite-dev
libxrandr-dev

git clone https://github.com/tryone144/compton.git /usr/local/src/compton
cd /usr/local/src/compton
make
make install
