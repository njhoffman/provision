#!/bin/bash

sudo apt install meson
ghq get -l mpv-player/mpv/
meson build
meson compile -C build
meson install -C build

# https://github.com/purarue/mpv-sockets
ghq get -l purarue/mpv-sockets
cd ~/git/mpv-sockets
make

# https://github.com/purarue/mpv-history-daemon
pipx install mpv-history-daemon
# https://github.com/purarue/bleanser
