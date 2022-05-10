#!/bin/bash

mkdir -p ~/ghq/github.com/charmbracelet && cd ~/ghq/github.com/charmbracelet
git clone git@github.com:charmbracelet/glow.git && cd glow
go build
install glow ~/.local/bin
