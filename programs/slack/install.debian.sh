#!/bin/bash

ver="4.25.0"
base="https://downloads.slack-edge.com/releases/linux"
file="slack-desktop-$ver-amd64.deb"

cd ~/Downloads
wget "$base/$ver/prod/x64/$file"
chmod +x "$file" \
  && sudo dpkg -i "$file"
