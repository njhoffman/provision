#!/bin/bash

partition="/dev/sda" # lsblk
version="23.04"
file="ubuntu-$version-desktop-amd64.iso"
url="http://releases.ubuntu.com/$version/$file"
# url=http://cdimage.ubuntu.com/focal/daily-live/current/focal-desktop-amd64.iso

cd "$HOME/Downloads" && wget "$url"
umount "$partition"
sudo dd if="$HOME/Downloads/$file" of="$partition" bs=4M oflag=sync status=progress
# sudo apt install gnome-multi-writer pv
# sudo dd if="$HOME/Downloads/ubuntu-23.04-desktop-amd64.iso" | pv | sudo dd of="$partition" bs=4M conv=fdatasync
#
# after reboot, update packages, restart,
# terminal preferences: deja vu sans mono font, transparent custom background
