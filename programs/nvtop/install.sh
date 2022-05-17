#!/bin/bash
# https://github.com/Syllo/nvtop/raw/master/README.markdown

sudo apt install cmake libncurses5-dev libncursesw5-dev git
mkdir -p ~/ghq/github.com/Syllo
git clone https://github.com/Syllo/nvtop.git ~/ghq/github.com/Syllo
cd ~/ghq/github.com/Syllo && mkdir -p nvtop/build
cmake -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON
make

# Install globally on the system
sudo make install

# Alternatively, install without privileges at a location of your choosing
# make DESTDIR="/your/install/path" install
