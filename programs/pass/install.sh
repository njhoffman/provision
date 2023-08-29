#!/bin/bash

mkdir -p ~/ghq/git.zx2c4.com/password-store && cd ~/ghq/github.com/git.zx2c4.com/password-store
ghq get https://git.zx2c4.com/password-store
cd ~/ghq/git.zx2c4.com/password-store
sudo make install
