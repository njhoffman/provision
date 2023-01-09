#!/bin/zsh

# ripgrep: file grepper
# BurntSushi/ripgrep
zinit ice as"command" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg" sbin'**/rg -> rg'
zinit light BurntSushi/ripgrep

