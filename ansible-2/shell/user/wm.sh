#!/bin/bash

dir=$HOME/resources

msg "Copying config for: nitrogen, termite"
cp -rv $dir/dotfiles/.config/nitrogen $HOME/.config
cp -rv $dir/dotfiles/.config/termite $HOME/.config
