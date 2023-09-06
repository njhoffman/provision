#!/bin/bash

# install core utils, zsh
sudo apt install bash-doc bison byacc build-essential locate manpages-dev pkg-config subversion zsh # autotools-dev automake
# install core dev libs
sudo apt install devscripts libssl-dev libreadline-dev libsqlite3-dev libbz2-dev libevent-dev zlib1g-dev
# install avahi utils
sudo apt install avahi-autoipd avahi-daemon avahi-discover avahi-utils
# install python and python packages
sudo apt install python3 2to3 python3-pip pipx python-setuptools python3-venv
# install x11 utils
sudo apt install xsel xclip xdotool wmctrl
# install random utils
sudo apt install autorandr ccze fasd grc jq most sqlite3 thefuck wdiff
# video utils and codecs
sudo apt install ubuntu-restricted-extras ffmpeg
# audio utilities
sudo apt install mpc ncmpcpp pavucontrol libpulse0 pamixer alsa-utils alsa-tools librust-alsa-sys-dev libalsaplayer-dev libasound2-dev
# install network utils
sudo apt install blueman cifs-utils curl net-tools nmap smbclient traceroute nfs-common
# --  sudo apt install lockd, statd, showmount, nfsstat, gssd, idmapd and mount.nfs.
sudo apt install keychain
