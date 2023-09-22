#!/bin/bash

sudo apt install libinput-tools
pipx install "git+http://github.com/phillipberndt/autorandr#egg=autorandr"
ghq get -l phillipberndt/autorandr
make install
sudo systemctl daemon-reload
sudo systemctl enable autorandr.service
sudo systemctl enable autorandr-lid-listener.service
# udevadm control --reload-rules
