#!/bin/bash

ghq git -l charmbracelet/glow
go build
install glow ~/.local/bin
