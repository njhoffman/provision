#!/bin/bash

sudo apt install \
  libdbus-1-dev \
  libncursesw5-dev \
  libpulse-dev \
  libssl-dev \
  libxcb1-dev \
  libxcb-render0-dev \
  libxcb-shape0-dev \
  libxcb-xfixes0-dev

# cargo install cargo-deb
# cargo deb

git clone https://github.com/hrkfdn/ncspot
cargo build --release

cargo install ncspot
