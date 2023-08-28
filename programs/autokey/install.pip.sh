#!/bin/bash

mkdir -p ~/.local/src
cd ~/.local/src
git clone git@github.com:autokey/autokey.git
cd autokey
python3 -m pipx install .
