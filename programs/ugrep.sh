#!/usr/bin/env bash

ghq get -l "/Genivia/ugrep"
autoreconf
make
sudo make install
