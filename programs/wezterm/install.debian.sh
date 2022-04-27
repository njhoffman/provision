#!/bin/bash

# https://wezfurlong.org/wezterm/install/linux.html

base="https://github.com/wez/wezterm/releases/download"
folder="nightly"
file="wezterm-nightly.Ubuntu18.04.deb"
# folder="20220408-101518-b908e2dd"
# file="WezTerm-20220408-101518-b908e2dd-Ubuntu18.04.deb"

cd ~/Downloads
curl -LO "$base/$folder/$file"
sudo chmod +x ./$file
sudo apt install -y ./$file
