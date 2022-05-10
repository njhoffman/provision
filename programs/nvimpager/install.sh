#!/bin/bash

pip3 install --user tasklib
sudo apt install scdoc
ghq get -l lucc/nvimpager
make PREFIX=$HOME/.local install
