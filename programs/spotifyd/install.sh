#!/bin/bash

sudo apt install \
  libalsaplayer-dev \
  libasound2-dev \
  libssl-dev \
  pkg-config

ghq get -l Spotifyd/spotifyd.git

cargo build --release
# cargo install --path .
cargo install --path .

cp ./contrib/spotifyd.service ~/.config/systemd/user

systemctl --user enable spotifyd.service
systemctl --user start spotifyd.service
