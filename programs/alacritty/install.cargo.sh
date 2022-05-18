#!/bin/bash

sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty

# installing desktop entry
sudo desktop-file-install ./Alacritty.desktop
sudo update-desktop-database
