#!/bin/bash

sudo apt install readline-dev
luarocks install --local readline

wget https://fennel-lang.org/downloads/fennel-1.3.0
chmod +x fennel-1.3.0
mv fennel-1.3.0 ~/.local/bin

# https://fennel-lang.org/downloads/fennel-1.3.0-x86_64
# chmod +x fennel-1.3.0*
