#!/bin/bash

# https://github.com/NikitaIvanovV/ctpv
sudo apt install libcrypt-dev libmagic-dev

sudo apt install \
  chafa \
  ffmpegthumbnailer

https://github.com/matthewblott/ueberzug-latest
udo apt install libx11-dev
sudo apt install libxext-dev
sudo apt install libxres-dev

# Previewing each file type requires specific programs.
# If a program is not found on the system, ctpv will try to use another one.
# Only one program is required for each file type
# . For example, you only need either elinks, lynx or w3m installed on your system to view HTML files.

# File types	Programs
# any	exiftool cat
# archive	atool
# audio	ffmpegthumbnailer ffmpeg
# diff	colordiff delta diff-so-fancy
# directory	ls
# font	fontimage
# gpg-encrypted	gpg
# html	elinks lynx w3m
# image	ueberzug chafa
# json	jq
# markdown	mdcat
# office	libreoffice
# pdf	pdftoppm
# svg	convert
# text	bat cat highlight source-highlight
# torrent	transmission-show
# video	ffmpegthumbnailer
