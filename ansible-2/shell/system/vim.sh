#!/bin/bash
# (system) vim installation

apt-get remove -y --purge \
	vim \
	vim-runtime \
	vim-gnome \
	vim-tiny \
	vim-common \
	vim-gui-common

rm -rf /usr/local/share/vim
rm /usr/bin/vim
mkdir /usr/include/lua5.1/include

cd /usr/local/src/
git clone https://github.com/vim/vim
cd vim/src
make distclean
# python3-dev --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config

./configure --with-features=huge \
            --enable-rubyinterp \
            --with-ruby-command=$(which ruby) \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-gui=auto \
            --enable-fail-if-missing \
            --enable-cscope
            # --with-lua-prefix=/usr/include/lua5.1 \
            # --enable-luainterp \
            # --with-luajit \

make
make install

## neovim
# cd /usr/local/src
# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
apt-get install python-dev python-pip python3-dev python3-pip
