#!/bin/bash
sudo apt install \
  dh-autoreconf \
  libxcb-keysyms1-dev \
  libpango1.0-dev \
  libxcb-util0-dev \
  xcb \
  libxcb1-dev \
  libxcb-icccm4-dev \
  libyajl-dev \
  libev-dev \
  libxcb-xkb-dev \
  libxcb-cursor-dev \
  libxkbcommon-dev \
  libxcb-xinerama0-dev \
  libxkbcommon-x11-dev \
  libstartup-notification0-dev \
  libxcb-randr0-dev \
  libxcb-xrm0 \
  libxcb-xrm-dev \
  libxcb-shape0 \
  libxcb-shape0-dev

sudo apt-get install python3 python3-pip python3-setuptools python3-wheel ninja-build
pip3 install --user meson

ghq get -l i3/i3

# compile
mkdir -p build && cd build
meson ..
ninja

sudo install i3 /usr/bin &&
  sudo install i3bar /usr/bin &&
  sudo install i3-config-wizard /usr/bin &&
  sudo install i3-dump-log /usr/bin &&
  sudo install i3-input /usr/bin &&
  sudo install i3-msg /usr/bin &&
  sudo install i3-nagbar /usr/bin

# sudo add-apt-repository ppa:regolith-linux/release
# sudo apt update
# sudo apt install i3-gaps
# go get github.com/eh-am/i3-tre e
