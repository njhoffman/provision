#!/bin/bash

sudo dpkg --add-architecture i386
# After that, you will need to update package repositories and install the following prerequisite packages that will be needed in order to download and run Steam. Execute the following commands in terminal.
sudo apt update
sudo apt install wget gdebi-core libgl1-mesa-glx:i386
# Next, you can execute the following wget command to download the official Steam software package.
wget -O ~/steam.deb http://media.steampowered.com/client/installer/steam.deb
# Note that this command will download the installer file to your current user’s home directory.
# Install the downloaded Steam package using the gdebi command:
sudo gdebi ~/steam.deb
