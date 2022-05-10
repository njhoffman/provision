#!/bin/bash

ghq get -l jarun/nnn

sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
sudo make strip install
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
