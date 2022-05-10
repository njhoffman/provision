#!/bin/bash

# wget https://github.com/ambientsound/pms/zipball/master
# https://codeload.github.com/ambientsound/pms/legacy.tar.gz/refs/heads/master

# alias pms-debug="pms --debug /tmp/pms.log 2>>/tmp/pms.log"

ghq get -l ambientsound/pms
# go mod download github.com/RoaringBitmap/roaring
go mod tidy
make install
