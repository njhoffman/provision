#!/bin/bash

ghq get -l https://git.zx2c4.com/password-store
make
sudo make install
