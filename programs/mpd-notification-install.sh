#!/bin/bash

ghq get -l https://github.com/eworm-de/mpd-notification
sudo apt install libiniparser-dev
make
sudo make install
sudo make install-bin
