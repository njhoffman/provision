#!/bin/bash

cd ~/.local/src && mkdir -p projectm && cd projectm
wget https://github.com/kblaschke/frontend-sdl2/releases/download/2.0-linux-pre1/projectMSDL-Linux-x86_64.tar.gz
tar xzvf projectMSDL-Linux-x86_64.tar.gz
cd .. && sudo cp -rv projectm /opt
sudo cp projectm.desktop /usr/local/share/applications
