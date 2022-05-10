#!/bin/bash

sudo apt install tar curl xclip libpcre2-dev libpcre3-dev
mkdir -p ~/.vim/sessions/restart ~/.vim/sessions/saved
pip3 install --user neovim-remote tasklib

mkdir -p ~/ghq/github.com/vlang && cd ~/ghq/github.com/vlang
git clone git@github.com:vlang/v.git && cd v
make
sudo install v /usr/bin

mkdir -p ~/ghq/github.com/NTBBloodbath && cd ~/ghq/github.com/NTBBloodbath
git clone git@github.com:NTBBloodbath/nvenv.git && cd nvenv
PATH=$PATH:~/ghq/github.com/vlang/v make linux
install bin/nvenv_linux ~/.local/bin/nvenv
# TODO: fix nvim "marks" loading error on first load

nvenv setup && nvenv install 0.7.0 && nvenv install nightly && nvenv use 0.7.0

# inside vim - PackerSync, LspInstall,
# sudo apt install python3.10-venv
