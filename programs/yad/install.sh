#!/bin/bash

sudo apt install libgtk-3-dev
# sudo apt install libwebkit2gtk-4.0-dev libwebkit2gtk-4.1-dev libwebkit2gtk-5.0-dev

ghq get -l v1cont/yad
autoreconf -ivf && intltoolize
./configure && make && make install
gtk-update-icon-cache
