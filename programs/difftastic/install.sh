#!/bin/bash

# ghq get -l https://github.com/Wilfred/difftastic
base="https://github.com/Wilfred/difftastic/releases/download/"
ver="0.28.0"
file="difft-x86_64-unknown-linux-gnu.tar.gz"

cd ~/Downloads \
  && wget "$base/$ver/$file"

tar xzvf difft-x86_64-unknown-linux-gnu.gz

install ./difftastic ~/.local/bin
