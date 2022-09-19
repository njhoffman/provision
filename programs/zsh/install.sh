#!/bin/bash

ver="5.9"
sudo apt install texinfo

wget "https://www.zsh.org/pub/zsh-$ver.tar.xz" -O "$HOME/Downloads/zsh-$ver.tar.xz"
cd ~/Downloads || false
tar -xvf "zsh-$ver.tar.xz"
cd "zsh-$ver" || false

./configure --prefix=/usr \
  --sysconfdir=/etc/zsh \
  --enable-etcdir=/etc/zsh \
  --enable-cap \
  --enable-gdbm &&
  make &&
  makeinfo Doc/zsh.texi --plaintext -o Doc/zsh.txt &&
  makeinfo Doc/zsh.texi --html -o Doc/html &&
  makeinfo Doc/zsh.texi --html --no-split --no-headers -o Doc/zsh.html

sudo make install &&
  sudo make infodir=/usr/share/info install.info &&
  sudo install -v -m755 -d "usr/share/doc/zsh-$ver/html" &&
  sudo install -v -m644 Doc/html/* /usr/share/doc/zsh-5.9/html &&
  sudo install -v -m644 Doc/zsh.{html,txt} /usr/share/doc/zsh-5.9

wget "https://www.zsh.org/pub/zsh-$ver-doc.tar.xz" -O "$HOME/Downloads/zsh-$ver-doc.tar.xz" &&
  cd ~/Downloads || false &&
  tar -xvf "zsh-$ver-doc.tar.xz" &&
  cd "zsh-$ver" || false

sudo make htmldir="/usr/share/doc/zsh-$ver/html" install.html &&
  sudo install -v -m644 Doc/zsh.dvi "/usr/share/doc/zsh-$ver"
