#!/bin/bash

# https://github.com/kamek-pf/ntfd/archive/refs/tags/0.2.2.tar.gz

# install haskell stack toolchain
curl -sSL https://get.haskellstack.org/ | sh

ghq get -l kamek-pf/ntfd
stack build
stack install
