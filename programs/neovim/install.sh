#!/bin/bash

mkdir -p ~/.vim/sessions
rm ~/.config/nvim/plugin/packer_compiled.lua

bash ~/.local/src/provision/programs/neuron/install.nix.sh

sudo apt get install taskwarrior dafault-jre default-jdk pwsh

cd ~/Downloads && wget https://github.com/PowerShell/PowerShell/releases/download/v7.2.7/powershell-lts_7.2.7-1.deb_amd64.deb &&
  dgkg -i powershell-lts_7.2.7-1.deb_amd64.deb

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

luarocks --local install lunamark
pip install howdoi

# fix vimade
pip3 install --user neovim neovim-remote
gem install neovim
npm install -g neovim

# plugins - [2022-12-01 01:49:15] ERROR: plugins.config.neuron-nvim - [2022-12-01 01:49:15] neuron is not executable
# plugins - [2022-12-01 01:49:15] ERROR: plugins.config.telescope-nvim - [2022-12-01 01:49:15] howdoi requires howdoi (https://github.com/gleitz/howdoi)
# plugins - [2022-12-01 01:49:15] ERROR: plugins.config.telescope-nvim - [2022-12-01 01:49:15]     This plugin requires http://jgm.github.io/lunamark.
#     Run from telescope-code-fence.nvim directory:
#       make install
#     Or install manually to ~/.luarocks:
#       luarocks --lua-dir=/usr/local/opt/lua@5.1 --lua-version=5.1 --local lunamark

# packer.nvim] [ERROR 01:00:13] async.lua:20: Error in coroutine: ...ack/packer/start/packe
# r.nvim/lua/packer/plugin_utils.lua:204: Vim(lua):E5108: Error executing lua ...are/nvim/si
# te/pack/packer/start/iswap.nvim/lua/iswap.lua:1: module 'nvim-treesitter.query' not found:
# ^Ino field package.preload['nvim-treesitter.query']
#
# go: require("go.health").check()
# ========================================================================
# ## Binaries
#   - INFO: go installed.
#   - INFO: Tool installed: golangci-lint
#   - WARNING: Missing tool: mockgen
#   - WARNING: Missing tool: gorename
#   - WARNING: Missing tool: iferr
#   - WARNING: Missing tool: callgraph
#   - INFO: Tool installed: gomodifytags
#   - WARNING: Missing tool: guru
#   - INFO: Tool installed: goimports
#   - INFO: Tool installed: golines
#   - WARNING: Missing tool: dlv
#   - WARNING: Missing tool: gomvp
#   - WARNING: Missing tool: json-to-struct
#   - INFO: Tool installed: gofumpt
#   - INFO: Tool installed: gopls
#   - WARNING: Missing tool: gotestsum
#   - INFO: Tool installed: richgo
#   - WARNING: Missing tool: ginkgo
#   - WARNING: Missing tool: fillswitch
#   - INFO: Tool installed: gotests
#   - WARNING: Missing tool: impl
#   - WARNING: Missing tool: fillstruct
# - INFO: GOPATH is not set
# - INFO: GOROOT is not set
# - INFO: GOBIN is not set
#
# - WARNING: **pwsh**: not available
# - WARNING: **Composer**: not available
# - WARNING: **PHP**: not available
# - WARNING: **javac**: not available
# - WARNING: **java**: not available
# - ERROR: **npm**: not available
# - ERROR: **node**: unsupported version `v12.22.8`. Node version must be >= 14
# - WARNING: `tree-sitter` executable not found (parser generator, only needed for :TSInstallFromGrammar, not required for :TSInstall)

# provider: health#provider#check
# ========================================================================
#   - ERROR: Failed to run healthcheck for "provider" plugin. Exception:
#     function health#check[20]..health#provider#check[4]..<SNR>402_check_ruby, line 15
#     Vim(let):E117: Unknown function: provider#ruby#Detect

# null-ls: require("null-ls.health").check()
# ========================================================================
#   - OK: shellcheck: the command "shellcheck" is executable.
#   - INFO: gitsigns: cannot verify if the command is an executable.
#   - ERROR: proselint: the command "proselint" is not executable.
#   - INFO: refactoring: cannot verify if the command is an executable.
#   - ERROR: prettier: the command "prettier" is not executable.
#   - ERROR: sqlfluff: the command "sqlfluff" is not executable.
#   - OK: shfmt: the command "shfmt" is executable.
#   - OK: stylua: the command "stylua" is executable.
#   - ERROR: black: the command "black" is not executable.
#   - OK: trim_whitespace: the command "awk" is executable.
#   - ERROR: xmllint: the command "xmllint" is not executable.
#   - OK: misspell: the command "misspell" is executable.
#   - ERROR: write_good: the command "write-good" is not executable.
#   - OK: shellcheck: the command "shellcheck" is executable.
#   - ERROR: sqlfluff: the command "sqlfluff" is not executable.
#   - INFO: trail-space: cannot verify if the command is an executable.
#   - OK: zsh: the command "zsh" is executable.
#   - INFO: todo-fixme: cannot verify if the command is an executable.

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
# make CMAKE_BUILD_TYPE=Debug
make CMAKE_INSTALL_PREFIX="$HOME/.local" CMAKE_BUILD_TYPE=RelWithDebInfo install
install build/bin/nvim ~/.local/bin
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
