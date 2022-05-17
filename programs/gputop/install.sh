#!/bin/bash

sudo apt-get install meson python2
sudo apt-get install libssl-dev
sudo apt-get install libgl1-mesa-dev libegl1-mesa-dev libglfw3-dev libepoxy-dev
sudo apt-get install libsoup2.4-dev libcogl-dev libgtk-3-dev

ghq get -l https://github.com/rib/gputop
meson . build
# meson . build -Dnative_ui=true
# meson . build -Dnative_ui_gtk=true
ninja -C build
ninja -C build install
