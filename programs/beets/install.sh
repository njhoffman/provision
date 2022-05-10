#!/bin/bash

ghq get -l beetbox/beets
python3 -m pip install .

mkdir -p ~/.beets
touch ~/.beets/musiclibrary.db

## install plugins
# https://github.com/abba23/beets-popularity
ghq get -l abba23/beets-popularity.git
pip install .

# replay gain
# possible backends: GStreamer, mp3gain, Python Audio Tools or ffmpeg
sudo apt install ffmpeg

# mpdstats
pip install python-mpd2

# install web extension
pip install flask
beet web
