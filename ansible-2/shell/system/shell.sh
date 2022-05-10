#!/bin/bash

# Build Zsh from sources on Ubuntu.
# From http://zsh.sourceforge.net/Arc/git.html and sources INSTALL file.

# Some packages may be missing
# xsel works better than xclip with nvim + tmux
sudo apt-get install -y \
  autoconf \
  ccze \
  colordiff \
  git-core \
  gnome-settings-daemon \
  gnome-system-monitor \
  keepassxc \
  libncursesw5-dev \
  lnav \
  make \
  multitail \
  texinfo \
  texi2html \
  xsel \
  yodl

mkdir -p /usr/local/src
cd /usr/local/src
git clone git://zsh.git.sf.net/gitroot/zsh/zsh

git clone https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux/tmux.git
cd zsh

./Util/preconfig

# Options from Ubuntu Zsh package rules file (http://launchpad.net/ubuntu/+source/zsh)
./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --bindir=/bin \
  --infodir=/usr/share/info \
  --enable-maildir-support \
  --enable-max-jobtable-size=256 \
  --enable-etcdir=/etc/zsh \
  --enable-function-subdirs \
  --enable-site-fndir=/usr/local/share/zsh/site-functions \
  --enable-fndir=/usr/share/zsh/functions \
  --with-tcsetpgrp \
  --with-term-lib="ncursesw" \
  --enable-cap \
  --enable-pcre \
  --enable-readnullcmd=pager \
  --enable-custom-patchlevel=Debian \
  LDFLAGS="-Wl,--as-needed -g"

make
make check
sudo make install
sudo make install.info

# tmux
apt-get install libevent-dev bison
cd /usr/local/src/tmux
git checkout 3.0
sh autogen.sh
./configure && make && make install


apt-get install -y \
  acpi \
  g++ \
  fzf \
  fzy \
  gperf build-essential \
  gtk-doc-tools gnutls-bin \
  intltool \
  libgirepository1.0-dev \
  libglib3.0-cil-dev \
  libgnutls28-dev \
  libgtk-3-dev \
  libpcre2-dev \
  libxml2-utils \
  peco \
  powerline-fonts \
  sddm \
  valac

gem install colorls
# to enable tab completion, put in .bashrc/.zshrc:
# source $(dirname $(gem which colorls))/tab_complete.sh

pip3 install powerline-status

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# sudo tar -xzvf ~/Downloads/sddm-chili.tar.gz -C /usr/share/sddm/themes
# sudo nano /usr/lib/sddm/sddm.conf.d/sddm.conf"
# find a way to show on only primary monitor
# https://store.kde.org/p/1240784/startdownload?file_id=1535341294&file_name=sddm-chili.tar.gz&file_type=application/x-gzip&file_size=1434058
# https://store.kde.org/p/1225550/startdownload?file_id=1522190299&file_name=earth-night.zip&file_type=application/zip&file_size=3399658
# https://store.kde.org/p/1272122/startdownload?file_id=1541375619&file_name=sugar-dark.tar.gz&file_type=application/x-gzip&file_size=2228983
