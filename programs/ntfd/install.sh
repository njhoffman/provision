#!/bin/bash

# https://github.com/kamek-pf/ntfd/archive/refs/tags/0.2.2.tar.gz

sudo apt install cabal-install

# install haskell stack toolchain
curl -sSL https://get.haskellstack.org/ | sh

mkdir -p ~/ghq/github.com/kamek-pf && cd ~/ghq/github.com/kamek-pf
git clone git@github.com:kamek-pf/ntfd.git && cd ntfd
stack build
stack install

wget https://github.com/kamek-pf/ntfd/releases/download/0.2.2/ntfd-x86_64-unknown-linux-musl ~/Downloads
install ntfd-x86_64-unknown-linux-musl ~/.local/bin/ntfd

wget https://github.com/primer/octicons/archive/v17.11.1.tar.gz
tar xzv v17.11.1.tar.gz

wget https://github.com/erikflowers/weather-icons/archive/2.0.12.tar.gz
tar xzvf 2.0.12.tar.gz

wget https://github.com/google/material-design-icons/archive/4.0.0.tar.gz
tar xzvf 4.0.0.tar.gz

# sudo cp < your_file > /usr/share/fonts/
# # fc-cache -fv
