#!/bin/bash

# TODO: get recent release tag
# curl https://sh.rustup.rs -sSf | sh -s
# version="20220408-101518-b908e2dd"
# file="wezterm-20220408-101518-b908e2dd-src.tar.gz"
# curl -LO "https://github.com/wez/wezterm/releases/download/$version/$file"
# tar -xzf "$file" && cd "wezterm-$version"

mkdir -p ~/ghq/github.com/wez && cd ~/ghq/github.com/wez
git clone git@github.com:wez/wezterm.git && cd wezterm

./get-deps
cargo build --release
# cargo run --release --bin wezterm -- start
mkdir -p ~/.local/bin
# install target/release/wezterm ~/.local/bin
# TODO: make bin work outside of installatino directory

sudo desktop-fie-install ./Alacritty.desktop
sudo update-desktop-database
# sudo cp ./wezterm.desktop /usr/share/applications/org.wezfurlong.wezterm.desktop

# install terminfo file
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile
