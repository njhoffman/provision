#!/bin/bash

# https://github.com/kamek-pf/ntfd/archive/refs/tags/0.2.2.tar.gz

# install haskell stack toolchain
curl -sSL https://get.haskellstack.org/ | sh

mkdir -p ~/ghq/github.com/kamek-pf && cd ~/ghq/github.com/kamek-pf
git clone git@github.com:kamek-pf/ntfd.git && cd ntfd
stack build
stack install
