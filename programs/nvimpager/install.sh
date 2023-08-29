#!/bin/bash

pip3 install --user tasklib
sudo apt install scdoc

mkdir -p ~/ghq/github.com/lucc
cd ~/ghq/github.com/lucc
git clone git@github.com:lucc/nvimpager.git
cd nvimpager

make PREFIX="$HOME"/.local install
