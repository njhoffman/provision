#!/bin/bash

sudo apt install mpv curl yt-dlp dmenu # jq fzf
mkdir -p ~/ghq/github.com/pystardust \
  && git clone git@github.com:pystardust/ytfzf.git
sudo make install doc
