#!/bin/bash

# https://wezfurlong.org/wezterm/install/linux.html

base="https://github.com/wez/wezterm/releases/download"
folder="nightly"
file="WezTerm-nightly-Ubuntu18.04.AppImage"

# folder="20220408-101518-b908e2dd"
# file="WezTerm-20220408-101518-b908e2dd-Ubuntu18.04.AppImage"

cd ~/Downloads
curl -LO "$base/$folder/$file"
chmod +x $file
mkdir -p ~/.local/bin
mv "./$file" ~/.local/bin/wezterm
