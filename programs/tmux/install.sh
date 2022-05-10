#!/bin/bash

sudo apt-get update && apt-get upgrade
sudo apt-get install \
  build-essential \
  libc6-dev \
  libffi-dev \
  libgdbm-dev \
  libncursesw5-dev \
  libreadline \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  openssl \
  python-dev \
  python-pip \
  python-setuptools \
  python-smbus \
  tk-dev \
  zlib1g-dev

ghq get -l tmux/tmux
make
sudo make install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
