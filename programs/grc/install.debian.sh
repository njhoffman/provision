#!/bin/bash

sudo apt install grc

# copy customize confs
sudo cp -rv \
  ~/.config/grc/confs/* \
  /usr/local/share/grc/
