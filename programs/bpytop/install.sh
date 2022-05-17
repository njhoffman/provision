#!/bin/bash

python3 -m pip install psutil
ghq get -l https://github.com/aristocratos/bpytop
sudo make install
