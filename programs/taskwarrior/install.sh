#!/bin/bash

cd ~/Downloads
curl -O https://taskwarrior.org/download/task-2.6.2.tar.gz
tar xzf task-2.6.2.tar.gz
cd task-2.6.2


ghq get -l GothenburgBitFactory/taskwarrior
sudo apt install libtls-dev libgnutls30 libuuid1

cmake -DCMAKE_BUILD_TYPE=release .
make --keep-going
sudo make install
