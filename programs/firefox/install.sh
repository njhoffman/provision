#!/bin/bash

# https://www.mozilla.org/en-US/firefox/all/

base="https://download-installer.cdn.mozilla.net/pub/firefox/releases"
ver="99.0.1"
file="firefox-$ver.tar.bz2"
url="$base/$ver/linux-x86_64/en-US/$file"

cd ~/Downloads && wget "$url"
tar xvf "$file"
sudo mv firefox /opt
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications

# required:
#   glibc 2.17 or higher
#   GTK+ 3.14 or higher
#   libstdc++ 4.8.1 or higher
#   X.Org 1.0 or higher (1.7 or higher is recommended)
# optimal:
#   DBus 1.0 or higher
#   GNOME 2.16 or higher
#   libxtst 1.2.3 or higher
#   NetworkManager 0.7 or higher
#   PulseAudio
