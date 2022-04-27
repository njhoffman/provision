#!/bin/bash

ghq get -l beetbox/beets
python3 -m pip install .

mkdir -p ~/.beets
touch ~/.beets/musiclibrary.db

# install web extension
pip install flask
beet web
