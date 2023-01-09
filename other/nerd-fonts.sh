#!/bin/bash

mkdir -p ~/ghq/github.com/ryanoasis &&
  cd ~/ghq/github.com/ryanoasis && 
  git clone --depth=1 git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts && ./install.sh
