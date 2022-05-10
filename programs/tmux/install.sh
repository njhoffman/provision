#!/bin/bash

sudo apt-get update && apt-get upgrade
sudo apt-get install \
  build-essential \
  libc6-dev \
  libffi-dev \
  libgdbm-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  openssl \
  python-pip \
  python-setuptools \
  tk-dev \
  zlib1g-dev

mkdir -p ~/ghq/github.com/tmux && cd ~/ghq/github.com/tmux
git clone git@github.com:tmux/tmux.git && cd tmux
./autogen.sh
./configure
make
sudo make install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
