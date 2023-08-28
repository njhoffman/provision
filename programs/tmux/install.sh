#!/bin/bash

sudo apt-get update && apt-get upgrade
sudo apt-get install \
  build-essential \
  libc6-dev \
  libffi-dev \
  libgdbm-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  openssl \
  python3-pip \
  tk-dev \
  zlib1g-dev

mkdir -p ~/ghq/github.com/tmux && cd ~/ghq/github.com/tmux
git clone git@github.com:tmux/tmux.git && cd tmux
# to get ctrl-i working:
# key_bindings:
#   - { key: I, mods: Control, chars: "\x1b[105;5u" }
# input-keys.c: #51 add
# static struct input_key_entry input_key_defaults[] = {
#   /* Ctrl+i. */
#     { .key = 0x69 | KEYC_CTRL,
#       .data = "\x1b[105;5u"
#     },
# tty-keys.c: #988 change
# else if (onlykey >= 97 && onlykey <= 122)
# else if (onlykey >= 97 && onlykey <= 122 && onlykey != 105)

# autoconf
autoupdate -f
./autogen.sh
./configure
make
sudo make install

mkdir ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/.tmux/plugins/tpm/bin
TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/tpm update_plugins all
