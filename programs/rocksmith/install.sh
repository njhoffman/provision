#!/bin/bash
# https://github.com/theNizo/linux_rocksmith/

sudo apt install steam
export RUNNER="$HOME/.steam/debian-installation/steamapps/common/Proton 7.0"
# /home/nicholas/.steam/debian-installation/steamapps/common/Proton\ 7.0
./native-steam.sh
