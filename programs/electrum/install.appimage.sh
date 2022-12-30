#!/bin/bash

ver="4.3.2"

sudo apt-get install fuse libfuse2
cd ~/Downloads && wget "https://download.electrum.org/$ver/electrum-$ver-x86_64.AppImage"
chmod u+x "electrum-$ver-x86_64.AppImage"
./electrum-$ver-x86_64.AppImage
