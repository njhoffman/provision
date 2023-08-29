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

mkdir -p ~/ghq/github.com/neovim && cd ~/ghq/github.com/neovim
git clone git@github.com:neovim/neovim && cd neovim

# user="$HOME" user="nvimpager" user="nvimdocker"
user="$HOME"

rm -rfv "$HOME/.local/share/nvim/runtime"
make distclean && make deps
# make CMAKE_BUILD_TYPE=Debug
make CMAKE_INSTALL_PREFIX="$HOME/.local" CMAKE_BUILD_TYPE=RelWithDebInfo install
install build/bin/nvim ~/.local/bin

ln -s ~/.local/share/nvim/lazy ~/lazy
mkdir -p ~/.local/share/nvim/sessions/restart

## dependencies
mkdir -p ~/ghq/github.com/njhoffman && cd ~/ghq/github.com && git clone git@github.com:njhoffman/telescope.nvim
mkdir ~/git && ln -s ~/ghq/github.com/njhoffman/telescope.nvim ~/git/telescope.nvim
mkdir -p ~/ghq/github.com/njhoffman && cd ~/ghq/github.com && git clone git@github.com:njhoffman/clever-f.vim
mkdir ~/git && ln -s ~/ghq/github.com/njhoffman/clever-f.vim ~/git/clever-f.vim

bash ~/.local/src/provision/programs/neuron/install.nix.sh
sudo apt get install taskwarrior dafault-jre default-jdk pwsh

cd ~/Downloads && wget https://github.com/PowerShell/PowerShell/releases/download/v7.2.7/powershell-lts_7.2.7-1.deb_amd64.deb &&
  dgkg -i powershell-lts_7.2.7-1.deb_amd64.deb
luarocks --local install lunamark
pipx install howdoi
# fix vimade
pipx install --install-dep neovim-remote
pip3 install neovim
pipx install neovim-remote
gem install neovim
npm install -g neovim

go install github.com/abenz1267/gomvp@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/golang/mock/mockgen@latest
go install github.com/jimmyfrasche/closed/cmds/fillswitch@latest
go install github.com/josharian/impl@latest
go install github.com/motemen/go-iferr@latest
go install github.com/onsi/ginkgo@latest
go install github.com/tmc/json-to-struct@latest
go install golang.org/x/tools/cmd/callgraph@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install gotest.tools/gotestsum@latest

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
