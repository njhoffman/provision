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

sudo rm /usr/bin/i3 /usr/bin/i3bar /usr/bin/i3-config-wizard /usr/bin/i3-dump-log /usr/bin/i3-input /usr/bin/i3-msg /usr/bin/i3-nagbar
sudo rm /bin/i3 /bin/i3bar /bin/i3-config-wizard /bin/i3-dump-log /bin/i3-input /bin/i3-msg /bin/i3-nagbar

sudo install i3 /usr/local/bin &&
  sudo install i3bar /usr/local/bin &&
  sudo install i3-config-wizard /usr/local/bin &&
  sudo install i3-dump-log /usr/local/bin &&
  sudo install i3-input /usr/local/bin &&
  sudo install i3-msg /usr/local/bin &&
  sudo install i3-nagbar /usr/local/bin

