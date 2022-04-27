#!/bin/bash

# https://github.com/kdheepak/taskwarrior-tui
# https://github.com/kdheepak/taskwarrior-tui/releases/latest
# https://github.com/kdheepak/taskwarrior-tui/releases/download/v0.22.0/taskwarrior-tui-x86_64-unknown-linux-gnu.tar.gz
# https://github.com/kdheepak/taskwarrior-tui/releases/download/v0.22.0/taskwarrior-tui.deb
# https://github.com/kdheepak/taskwarrior-tui/releases/download/v0.22.0/taskwarrior-tui-ae2f98b-x86_64.AppImage

ghq get -l kdheepak/taskwarrior-tui
cargo install --path .
