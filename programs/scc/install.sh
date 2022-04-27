#!/bin/bash

# https://github.com/boyter/scc

base="https://github.com/boyter/scc/releases/download"
ver="3.0.0"
file="scc-$ver-x86_64-unknown-linux.zip"
url="$base/v${ver}/$file"
cd "$HOME/Downloads" || exit
wget "$url"
unzip "$file"
cd "scc-${ver}-x86_64-unknown-linux" || exit
install ./scc ~/.local/bin
