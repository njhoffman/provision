#!/bin/bash

ghq get -l https://github.com/soimort/translate-shell
make
sudo make install

# Dependencies
# GNU Awk (gawk) 4.0 or later
# curl with OpenSSL support
# mplayer, mpv, mpg123, or eSpeak
# less, more or most
# rlwrap: a GNU readline wrapper
# aspell or hunspell
