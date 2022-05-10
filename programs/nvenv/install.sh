#!/bin/bash
sudo apt install tar curl
ghq get -l vlang/v
make
ghq get -l NTBBloodbath/nvenv
make nvenv_linux
