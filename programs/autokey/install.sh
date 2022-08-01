#!/bin/bash

sudo apt install debhelper-compat dh-python pyqt5-dev-tools python3-all python3-pyqt5.qsci python3-pyqt5.qtsvg python3-xlib gir1.2-gtksource-3.0
mkdir -p ~/ghq/github.com/autokey && cd ~/ghq/github.com/autokey
git clone git@github.com:autokey/autokey.git && cd autokey
# pip3 install .
dpkg-buildpackage -us -uc
