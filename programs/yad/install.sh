#!/bin/bash

sudo apt install libgtk-3-dev

ghq get -l v1cont/yad
autoreconf -ivf && intltoolize
./configure && make && make install
gtk-update-icon-cache
