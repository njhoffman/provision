#!/bin/bash

# nix-env --install timewarrior

sudo apt install cmake make asciidoctor
# Asciidoctor (optional, only required for re-building man pages)

cd ~/Downloads
curl -L -O https://github.com/GothenburgBitFactory/timewarrior/releases/download/v1.4.3/timew-1.4.3.tar.gz
tar xzf timew-1.4.3.tar.gz
cd timew-1.4.3
cmake -DCMAKE_BUILD_TYPE=Release .
make
sudo make install
