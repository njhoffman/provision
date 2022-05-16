#!/bin/bash

mkdir -p ~/ghq/github.com/garabik && cd ~/ghq/github.com/garabik
git clone git@github.com:garabik/grc.git && cd grc
sudo ./install.sh

# copy customize confs
sudo cp -rv \
  ~/.config/grc/confs/* \
  /usr/local/share/grc/
