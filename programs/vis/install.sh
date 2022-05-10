#!/bin/bash

sudo apt install libfftw3-dev libncursesw5-dev cmake libpulse-dev

mkdir -p ~/ghq/github.com/dpayne && cd ~/ghq/github.com/dpayne
git clone git@github.com:dpayne/cli-visualizer.git && cd cli-visualizer
./install.sh
