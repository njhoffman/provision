#!/bin/bash

sudo adduser mopidy
sudo apt install gstreamer1.0-plugins-base-apps

sudo mkdir -p /usr/local/share/keyrings

sudo wget -q -O /usr/local/share/keyrings/mopidy-archive-keyring.gpg \
  https://apt.mopidy.com/mopidy.gpg

sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list
sudo apt update
sudo apt install mopidy

sudo apt install mopidy-mpd
sudo apt install mopidy-spotify
# authenticate mopidy with spotify
google-chrome "https://auth.mopidy.com/spotify/"

sudo apt install mopidy-beets
beet web

mopidy config
# sudo mopidyctl config
mopidy deps
