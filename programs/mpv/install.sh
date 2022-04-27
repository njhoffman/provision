#!/bin/bash

sudo apt install meson
ghq get -l mpv-player/mpv/
meson build
meson compile -C build
meson install -C build
