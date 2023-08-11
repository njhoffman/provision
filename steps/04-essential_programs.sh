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

# log into zsh for zinit initialization
mkdir ~/.local/man/ && sudo chsh /bin/zsh && /bin/zsh
~/ghq/github.com/njhoffman/provision/programs/alacritty/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/ansible/install.pip.sh
~/ghq/github.com/njhoffman/provision/other/nerd-fonts.sh
~/ghq/github.com/njhoffman/provision/programs/autokey/install.sh
# ~/ghq/github.com/njhoffman/provision/programs/chrome/install.sh
~/ghq/github.com/njhoffman/provision/programs/docker/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/i3/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/kitty/install.sh
~/ghq/github.com/njhoffman/provision/programs/neuron/install.nix.sh
~/ghq/github.com/njhoffman/provision/programs/nvenv/install.sh
~/ghq/github.com/njhoffman/provision/programs/nvimpager/install.sh
~/ghq/github.com/njhoffman/provision/programs/picom/install.sh
~/ghq/github.com/njhoffman/provision/programs/polybar/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/rofi/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/tmux/install.sh
~/ghq/github.com/njhoffman/provision/programs/tmuxp/install.sh
~/ghq/github.com/njhoffman/provision/programs/wezterm/install.debian.sh
