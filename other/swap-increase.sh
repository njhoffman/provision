#!/bin/bash

swapon --show          # see what swap files you have active
sudo swapoff /swapfile # disable /swapfile
# Create a new 16 GiB swap file in its place (could lock up your computer
# for a few minutes if using a spinning Hard Disk Drive [HDD], so be patient)
# (Ex: on 15 May 2023, this took 3 min 3 sec on a 5400 RPM 750 GB
# model HGST HTS541075A9E680 SATA 2.6, 3.0Gb/s HDD in an old laptop of mine)
sudo dd if=/dev/zero of=/swapfile count=32 bs=1G
sudo mkswap /swapfile     # turn this new file into swap space
sudo chmod 0600 /swapfile # only let root read from/write to it, for security
sudo swapon /swapfile     # enable it
swapon --show             # ensure it is now active

## in case this is the first time creating swapfile
# Make a backup copy of your /etc/fstab file just in case you make any mistakes
sudo cp /etc/fstab /etc/fstab.bak
# Add this swapfile entry to the end of the file to re-enable
# the swap file after each boot
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
