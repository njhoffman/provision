#!/bin/bash

# sudo apt install autokey-common autokey-gtk

ver="0.96.0"

sudo apt install python3-packaging python3-tk

cd "$HOME/Downloads"
wget "https://github.com/autokey/autokey/releases/download/v${ver}/autokey-common_${ver}_all.deb"
wget "https://github.com/autokey/autokey/releases/download/v${ver}/autokey-gtk_${ver}_all.deb"
wget "https://github.com/autokey/autokey/releases/download/v${ver}/autokey-qt_${ver}_all.deb"

sudo dpkg -i "autokey-common_${ver}_all.deb"
sudo dpkg -i "autokey-gtk_${ver}_all.deb"
sudo dpkg -i "autokey-qt_${ver}_all.deb"
rm "$HOME/Downloads/autokey-"*.deb

# ghq get -l git@github.com:autokey/autokey.git
# pip3 install .
# git checkout $VERSION
# uscan -dd
# cd .. && tar xzvf autokey-$VERSION.tar.gz
# cd "autokey-$VERSION"
# dpkg-buildpackage -b
# dpkg-buildpackage -us -uc
