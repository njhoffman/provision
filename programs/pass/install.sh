#!/bin/bash


# mkdir -p ~/ghq/github.com/wez && cd ~/ghq/github.com/wez
# git clone git@github.com:wez/wezterm.git && cd wezterm
ghq get https://git.zx2c4.com/password-store
cd ~/ghq/git.zx2c4.com/password-store
sudo make install
