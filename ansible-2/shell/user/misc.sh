#!/bin/bash

# prevent sshd closing connection
mkdir -p $HOME/.ssh
echo "Host *\nServerAliveInterval 240" > $HOME/.ssh/config
chmod 600 $HOME/.ssh/config

# hue lights cli
npm install -g hueadm

# timewarrior
mkdir -p $HOME/.local/src && cd $HOME/.local/src
wget https://github.com/GothenburgBitFactory/timewarrior/releases/download/v1.2.0/timew-1.2.0.tar.gz
tar xzf timew-1.2.0.tar.gz
cd timew-1.2.0
cmake -DCMAKE_BUILD_TYPE=release
make
sudo make install
