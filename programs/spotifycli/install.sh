#!/bin/bash

sudo apt install python-dbus lyricwikia

ghq get -l pwittchen/spotify-cli-linux.git
sudo cp spotifycli/spotifycli.py /usr/local/bin/spotifycli
