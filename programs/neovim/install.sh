#!/bin/bash

sudo apt-get install \
  ninja-build \
  gettext \
  libtool \
  libtool-bin \
  autoconf \
  automake \
  cmake \
  g++ \
  pkg-config \
  unzip \
  curl \
  doxygen

ghq get -l neovim/neovim

# user="$HOME" user="nvimpager" user="nvimdocker"
user="$HOME"
make distclean && make deps
make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_INSTALL_PREFIX="$user/.local" install
# sudo make install

# make test | bat -l Makefile
# make unittest | bat -L Makefile
# make functionaltest | bat -L Makefile

# sudo apt install \
#   luajit \
#   luajit-5.1-dev \
#   lua-mpack \
#   lua-lpeg \
#   libunibilium-dev \
#   libmsgpack-dev \
#   libtermkey-dev
#
# mkdir .deps && cd .deps || exit
# cmake ../cmake.deps/ -DUSE_BUNDLED=OFF -DUSE_BUNDLED_LIBUV=ON -DUSE_BUNDLED_LUV=ON -DUSE_BUNDLED_LIBVTERM=ON -DUSE_BUNDLED_TS=ON
# ninja
# cd .. && mkdir build && cd build || exit
# cmake ..
# ninja

# Note: the development releases deliberately do NOT install a symlink for luajit
# You can do this now by running this command (with sudo):
# ln -sf luajit-2.1.0-beta3 /home/nicholas/ghq/github.com/neovim/neovim/.deps/usr/bin/luajit
