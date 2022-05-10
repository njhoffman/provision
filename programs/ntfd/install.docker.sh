#!/bin/bash

ghq get -l kamek-pf/ntfd
docker build -t kamek-pf/ntfd .
docker run --rm -ti -v $(pwd):/mnt kamek-pf/ntfd /bin/sh -c 'cp ntfd /mnt'
install ntfd ~/.local/bin && rm ./ntfd
