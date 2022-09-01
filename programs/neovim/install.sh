#!/bin/bash
ghq get -l neovim/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/home/nicholas/.local/bin
make install
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install

# Note: the development releases deliberately do NOT install a symlink for luajit
# You can do this now by running this command (with sudo):
ln -sf luajit-2.1.0-beta3 /home/nicholas/ghq/github.com/neovim/neovim/.deps/usr/bin/luajit
