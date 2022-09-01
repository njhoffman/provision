#!/bin/bash

# https://github.com/neovide/neovide
sudo apt install -y curl \
  gnupg ca-certificates git \
  gcc-multilib g++-multilib cmake libssl-dev pkg-config \
  libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
  libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev

# git clone https://github.com/neovide/neovide

# cd neovide

# cargo install --path .

# The resulting binary is to be found under ~/.cargo/bin. In case you want a nice application bundle:

# cargo install cargo-bundle

# cargo bundle --release

# Copy ./target/release/bundle/osx/neovide.app to ~/Applications and enjoy.

