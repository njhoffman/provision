#!/bin/bash

ghq get -l mopidy/mopidy
python3 -m pip install .

# extensions from source
# workon mopidy
ghq get -l mopidy/mopidy-spotify.git
pip install --editable .
ghq get -l mopidy/mopidy-beets.git
pip install --editable .
ghq get -l mopidy/mopidy-mpd.git
pip install --editable .

# sudo systemctl enable mopidy
# sudo mv /etc/mopidy/mopidy.conf ~/.config/mopidy/mopidy.etc.conf
# sudo ln -s ~/.config/mopidy/mopidy.conf /etc/mopidy/mopidy.conf
