#!/bin/bash

mkdir -p ~/.local/src &&
  cd ~/.local/src &&
  git clone --depth=1 git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts && ./install.sh
rm -rfv ~/.local/src/nerd-fonts
