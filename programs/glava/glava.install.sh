#!/bin/bash

sudo apt-get install \
  libgl1-mesa-dev \
  libpulse0 \
  libpulse-dev \
  libxext6 \
  libxext-dev \
  libxrender-dev \
  libxcomposite-dev \
  liblua5.3-dev \
  liblua5.3 \
  lua-lgi \
  lua-filesystem \
  libobs0 \
  libobs-dev \
  meson \
  build-essential \
  gcc

ghq get -l https://github.com/jarcode-foss/glava
meson build --prefix /usr
ninja -C build
sudo ninja -C build install
