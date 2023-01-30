#!/bin/bash

flatpak install https://flathub.org/apps/details/com.github.neithern.g4music
# or:

sudo apt install valac libadwaita-1-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
ghq get -l neithern/g4music
meson setup build --buildtype=release
meson install -C build
