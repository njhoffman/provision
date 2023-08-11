#!/bin/bash

## install essential programs
# clone asdf, install plugins and programs
# asdf pre: sudo apt install re2c uuid-dev libxml2-dev icu-doc
# asdf php pre: sudo apt install libcurl4-openssl-dev libzip-dev libpq-dev libonig-dev libgd-dev
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf-install-missing-plugins
asdf-install-missing-versions # (read custom pre-install and post-install hooks)

# copy custom grc confs for root programs
sudo cp -rv "$HOME/.config/grc/confs/"* /usr/share/grc

# clone histdb
rm -rfv ~/.histdb && git clone git@github.com:njhoffman/zsh-history.git ~/.histdb

## log into zsh for zinit initialization
mkdir ~/.local/man/ && sudo chsh "$USER" -s /bin/zsh && /bin/zsh
##

dir="$HOME/ghq/github.com/njhoffman/provision/programs"
dir_other="$HOME/ghq/github.com/njhoffman/provision/other"

"$dir/alacritty/install.cargo.sh"
"$dir/ansible/install.pip.sh"
"$dir_other/nerd-fonts.sh"
"$dir/autokey/install.sh"
# $dir/chrome/install.sh"
"$dir/docker/install.debian.sh"
"$dir/i3/install.debian.sh"
"$dir/kitty/install.sh"
"$dir/neuron/install.nix.sh"
"$dir/nvenv/install.sh"
"$dir/nvimpager/install.sh"
"$dir/picom/install.sh"
"$dir/polybar/install.debian.sh"
"$dir/rofi/install.debian.sh"
"$dir/tmux/install.sh"
"$dir/tmuxp/install.sh"
"$dir/wezterm/install.debian.sh"
