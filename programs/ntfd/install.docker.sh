#!/bin/bash

mkdir -p ~/ghq/github.com/kamek-pf && cd ~/ghq/github.com/kamek-pf
git clone git@github.com:kamek-pf/ntfd.git && cd ntfd
docker build -t kamek-pf/ntfd .
docker run --rm -ti -v $(pwd):/mnt kamek-pf/ntfd /bin/sh -c 'cp ntfd /mnt'
install ntfd ~/.local/bin && rm ./ntfd
