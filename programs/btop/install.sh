#!/bin/bash
# https://raw.githubusercontent.com/aristocratos/btop/main/README.md

# edit src/btop_input.cpp, add {"\x02", "page_up"} {"\x06", "page_down"}
sudo apt install coreutils sed git build-essential gcc-11 g++-11
ghq get -l aristocratos/btop
make install
# run after make install and use same PREFIX if any was used at install
# set SU_USER and SU_GROUP to select user and group, default is root:root
sudo make setuid
