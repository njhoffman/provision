#!/bin/bash

VERSION=0.96.0

sudo apt install debhelper-compat dh-python pyqt5-dev-tools python3-all python3-pyqt5.qsci python3-pyqt5.qtsvg python3-xlib gir1.2-gtksource-3.0
# Packaging dependencies
sudo apt install build-essential debhelper dpkg-dev devscripts git devscripts
# Build dependencies
sudo apt install python3-all python3-setuptools python3-pytest
# Optional, but recommended. If you want to build an optimized Qt GUI build.
sudo apt install pyqt5-dev-tools
sudo apt install xautomation kdialog  # visgrep png2pat xte xmousepos

# ghq get -l git@github.com:autokey/autokey.git 
# pip3 install .
# git checkout $VERSION
# uscan -dd
# cd .. && tar xzvf autokey-$VERSION.tar.gz
# cd "autokey-$VERSION"
# dpkg-buildpackage -b
# dpkg-buildpackage -us -uc
