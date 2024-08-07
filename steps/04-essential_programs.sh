#!/bin/bash

## install essential programs
# clone asdf, install plugins and programs
# asdf pre: sudo apt install re2c uuid-dev libxml2-dev icu-doc
# asdf php pre: sudo apt install libcurl4-openssl-dev libzip-dev libpq-dev libonig-dev libgd-dev
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf plugin add luajit git@github.com:smashedtoatoms/asdf-luaJIT.git
asdf install luajit 2.1.0-beta3
ln -s ~/.asdf/installs/luajit/2.1.0-beta3--3.4.0/bin/luajit ~/.local/bin/lua
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
"$dir/wezterm/install.debian.sh"
"$dir/kitty/install.sh"
"$dir/ripgrep/install.cargo.sh"
"$dir/colorls/install.gem.sh"
"$dir/ansible/install.pip.sh"
"$dir_other/nerd-fonts.sh"
"$dir/autokey/install.pip.sh"
# $dir/chrome/install.sh"
"$dir/docker/install.debian.sh"
"$dir/i3/install.debian.sh"
"$dir/neovim/install.sh"
# "$dir/nvenv/install.sh"
"$dir/nvimpager/install.sh"
"$dir/picom/install.debian.sh"
"$dir/polybar/install.debian.sh"
"$dir/rofi/install.debian.sh"
"$dir/tmux/install.sh"
"$dir/tmuxp/install.sh"
