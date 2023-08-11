#!/bin/bash

# install core utils, zsh
sudo apt install add-apt-key bash-doc bison byacc build-essential locate manpages-dev pkg-config zsh # autotools-dev automake
# install core dev libs
sudo apt install devscripts libssl-dev libreadline-dev libsqlite3-dev libbz2-dev libevent-dev zlib1g-dev
# install network utils
sudo apt install blueman cifs-utils curl net-tools nmap smbclient traceroute nfs-common
# --  sudo apt install lockd, statd, showmount, nfsstat, gssd, idmapd and mount.nfs.
# install avahi utils
sudo apt install avahi-autoipd avahi-daemon avahi-discover avahi-utils
# install python and python packages
sudo apt install python python-is-python3 python3-pip python-setuptools python3-venv
# install x11 utils
sudo apt install xsel xclip xdotool wmctrl
# install random utils
sudo apt install autorandr ccze fasd grc jq most sqlite3 thefuck wdiff
# video utils and codecs
sudo apt install ubuntu-restricted-extras ffmpeg
