#!/bin/bash

sudo apt install tar curl

mkdir -p ~/ghq/github.com/vlang && cd ~/ghq/github.com/vlang
git clone git@github.com:vlang/v.git && cd v
make

mkdir -p ~/ghq/github.com/NTBBloodbath && cd ~/ghq/github.com/NTBBloodbath
git clone git@github.com:NTBBloodbath/nvenv.git && cd nvenv
make nvenv_linux
