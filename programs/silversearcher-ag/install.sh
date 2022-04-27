#!/bin/bash

apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
ghq get -l ggreer/the_silver_searcher
./build.sh
