#!/bin/bash

ghq get --shallow -l https://github.com/ryanoasis/nerd-fonts
# git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
# ./install.sh
# ./install.sh DejaVuSansMono

# Other Good Fonts to Patch:
# Input Mono
# PragmataPro
# Consolas
# Operator Mono
# Dank Mono

# patching:
# docker run --rm -v /path/to/fonts:/in -v /path/for/output:/out nerdfonts/patcher [OPTIONS]

# ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf
# ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf -s -q
# ./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --use-single-width-glyphs --quiet
#
# ./font-patcher Inconsolata.otf --fontawesome
# ./font-patcher Inconsolata.otf --fontawesome --octicons --pomicons
# ./font-patcher Inconsolata.otf
#
# ./FontForge.AppImage -script /tmp/nerdfonts/font-patcher /tmp/nerdfonts/CascadiaMonoPL-Semibold.ttf --fontawesome -out /tmp
# ./FontForge.AppImage -script $PWD/font-patcher $PWD/CascadiaMonoPL-Semibold.ttf --octicons -out $HOME
#
# docker run --rm -v ~/myfont/patchme:/in -v ~/myfont/patched:/out nerdfonts/patcher
# docker run --rm -v ~/Desktop/myfont/patchme:/in -v ~/Desktop/myfont/patched:/out nerdfonts/patcher --fontawesome
