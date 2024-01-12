#!/usr/bin/env bash

cd ~/Downloads
wget https://dl.pstmn.io/download/latest/linux_64

install -t ~/.local/share/applications/ / < /path/to/file > /Postman/app/resources/Postman.desktop
# Enter the following content in the file, replacing </path/to/file> with the location of the file, and save it:
# [Desktop Entry]
# Encoding=UTF-8
# Name=Postman
# Exec=</path/to/file>/Postman/app/Postman %U
# Icon=</path/to/file>/Postman/app/resources/app/assets/icon.png
# Terminal=false
# Type=Application
# Categories=Development;
#

# cli installation
curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh
