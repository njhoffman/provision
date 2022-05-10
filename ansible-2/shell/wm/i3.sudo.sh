#!/bin/bash

sudo apt-get install -y \
  asciidoc
  libconfig-dev
  libnotify-bin
  notify-osd
  wmctrl

cd /usr/local/src
git clone  https://github.com/chjj/compton
cd compton
make
make docs
make install

# wget https://raw.githubusercontent.com/dylanaraps/wal/master/wal $HOME/bin
