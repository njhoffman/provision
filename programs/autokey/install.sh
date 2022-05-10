#!/bin/bash

mkdir -p ~/ghq/github.com/autokey && cd ~/ghq/github.com/autokey
git clone git@github.com:autokey/autokey.git && cd autokey
pip3 install .
