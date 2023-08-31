#!/bin/bash

# personal packages
ghq get -l njhoffman/prettypath && luarocks install ./prettypath-dev-2.rockspec
ghq get -l njhoffman/clever-f.vim
ghq get -l njhoffman/fidget.nvim
ghq get -l njhoffman/fzfmenu
ghq get -l njhoffman/nvim-notify
ghq get -l njhoffman/provision
ghq get -l njhoffman/slimux
ghq get -l njhoffman/telescope.nvim
ghq get -l njhoffman/vim-easy-align
ghq get -l njhoffman/which-key.nvim@master

~/bin/repoman/repos

# install wallpapers
git clone git@github.com:njhoffman/resources-wallpaper.git ~/wallpaper

# setup a sink by default for pulseaudio
pacmd load-module module-pipe-sink file=/tmp/pulse.fifo
pacmd list-sinks # search your default sink
pacmd load-module module-combine-sink slaves=yoursink,fifo_output
pacmd set-default-sink combined

## alsa config
# pcm.writeFile {
#   type file
#   slave.pcm null
#   file "/tmp/alsa.fifo"
#   format "raw"
# }
