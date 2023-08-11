#!/bin/bash

sudo apt install git keychain
ssh-keygen && ssh -T rsa -C 'njhoffman1982@gmail.com' && ssh-add -l -E sha256
eval "$(ssh-agent -s)" && ssh-add -l -E md5
# add ssh key to github, clone provision
mkdir -p ~/ghq/github.com/njhoffman && cd ~/ghq/github.com/njhoffman && git clone git@github.com:njhoffman/provision.git

# install dotbare, clone dotbare
git clone https://github.com/kazhala/dotbare.git ~/.dotbare
export PATH=$PATH:$HOME/.dotbare
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"
dotbare finit -u https://github.com/njhoffman/dotfiles.git
