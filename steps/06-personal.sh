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
