#!/bin/bash
# https://raw.githubusercontent.com/alacritty/alacritty/master/README.md
# https://raw.githubusercontent.com/alacritty/alacritty/master/INSTALL.md

ghq get -l https://github.com/alacritty/alacritty/blob/master/INSTALL.md#desktop-entry
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

make build

cargo build --release
sudo install target/release/alacritty /usr/local/bin # or anywhere else in $PATH

# installing desktop entry
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
