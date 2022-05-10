#!/bin/bash

mkdir -p ~/ghq/github.com/tmux-python && cd ~/ghq/github.com/tmux-python
git clone git@github.com:tmux-python/tmuxp.git && cd tmuxp
pip3 install .
