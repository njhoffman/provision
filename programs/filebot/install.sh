#!/bin/bash

base="https://get.filebot.net/filebot"
version="4.9.6"
file="FileBot_${version}_amd64.deb"
url="$base/FileBot_${version}/$file"
cd ~/Downloads
wget "$url"
sudo dpkg -i "$file"

filebot
cp filebot.psm ~/.filebot.psm
filebot --license ~/.filebot.psm
