#!/bin/bash

ghq get -l https://github.com/charmbracelet/glow.git
go build
install glow ~/.local/bin
