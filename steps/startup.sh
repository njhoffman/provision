#!/bin/bash

# random init
~/ghq/github.com/njhoffman/provision/programs/gh-cli/install.extensions.sh
bat cache --build
#   init njhoffman gh repos (special: zettelkasten)
#   uninstall snap packages (firefox)
#   scan ~/bin and install dependencies
# fzf post-install: ghq get -l junegunn/fzf && cp -rv man/man1/* /usr/share/man/man1 && mandb

# personal packages
ghq get -l njhoffman/prettypath && luarocks install ./prettypath-dev-1.rockspec
ghq get -l njhoffman/clever-f.vim
ghq get -l njhoffman/fidget.nvim
ghq get -l njhoffman/fzfmenu
ghq get -l njhoffman/nvim-notify
ghq get -l njhoffman/provision
ghq get -l njhoffman/slimux
ghq get -l njhoffman/telescope.nvim
ghq get -l njhoffman/vim-easy-align
ghq get -l njhoffman/which-key.nvim@master
~/bin/repoman/repos

cargo install alt broot cargo-update chr devicon-lookup dotenv-linter exa \
  maple navi spotify-tui spotifyd st stylua taskwarrior-tui tealdeer zeta-note zoxide

pip3 install youtube-dl howdoi assume command-not-found pynvim

# audio utilities
sudo apt install mpc ncmpcpp pavucontrol libpulse0 pamixer alsa-utils alsa-tools librust-alsa-sys-dev libalsaplayer-dev libasound2-dev

# docker post-install: usermod -aG docker nicholas && docker build whalesay/whalesay

touch ~/.config/nitrogen/bg-saved.cfg
sudo apt install nitrogen
sudo apt install flashfocus # systemctl --user start flashfocus.service && systemctl --user enable flashfocus.service

sudo add-apt-repository ppa:micahflee/ppa # release focal
sudo apt install torbrowser-launcher
# settings -> themes -> dark mode

# install wallpapers
git clone git@github.com:njhoffman/resources-wallpaper.git ~/wallpaper

# thumbnails
# sudo apt-get install ffmpeg ffmpegthumbnailer gstreamer0.10-ffmpeg
# sudo vi /usr/share/thumbnailers/totem.thumbnailer
# [Thumbnailer Entry]
# TryExec=ffmpegthumbnailer
# Exec=ffmpegthumbnailer -s %s -i %i -o %o -c png -f -t 10
# MimeType=application/mxf;application/ogg;application/ram;application/sdp;application/vnd.ms-wpl;application/vnd.rn-realmedia;application/x-extension-m4a;application/x-extension-mp4;application/x-flash-video;application/x-matroska;application/x-netshow-channel;application/x-ogg;application/x-quicktimeplayer;application/x-shorten;image/vnd.rn-realpix;image/x-pict;misc/ultravox;text/x-google-video-pointer;video/3gpp;video/dv;video/fli;video/flv;video/mp2t;video/mp4;video/mp4v-es;video/mpeg;video/msvideo;video/ogg;video/quicktime;video/vivo;video/vnd.divx;video/vnd.rn-realvideo;video/vnd.vivo;video/webm;video/x-anim;video/x-avi;video/x-flc;video/x-fli;video/x-flic;video/x-flv;video/x-m4v;video/x-matroska;video/x-mpeg;video/x-ms-asf;video/x-ms-asx;video/x-msvideo;video/x-ms-wm;video/x-ms-wmv;video/x-ms-wmx;video/x-ms-wvx;video/x-nsv;video/x-ogm+ogg;video/x-theora+ogg;video/x-totem-stream;audio/x-pn-realaudio;audio/3gpp;audio/ac3;audio/AMR;audio/AMR-WB;audio/basic;audio/midi;audio/mp2;audio/mp4;audio/mpeg;audio/ogg;audio/prs.sid;audio/vnd.rn-realaudio;audio/x-aiff;audio/x-ape;audio/x-flac;audio/x-gsm;audio/x-it;audio/x-m4a;audio/x-matroska;audio/x-mod;audio/x-mp3;audio/x-mpeg;audio/x-ms-asf;audio/x-ms-asx;audio/x-ms-wax;audio/x-ms-wma;audio/x-musepack;audio/x-pn-aiff;audio/x-pn-au;audio/x-pn-wav;audio/x-pn-windows-acm;audio/x-realaudio;audio/x-real-audio;audio/x-sbc;audio/x-speex;audio/x-tta;audio/x-wav;audio/x-wavpack;audio/x-vorbis;audio/x-vorbis+ogg;audio/x-xm;application/x-flac;

# if nvidia:
sudo apt install mesa-utils
~/ghq/github.com/njhoffman/provision/programs/gpustat/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/nvidia/install.sh
ubuntu-drivers autoinstall

# TODO: figure out command to disable ipv6 for access point
#!/bin/sh -e
# sysctl -w net.ipv6.conf.all.disable_ipv6=1
# sysctl -w net.ipv6.conf.default.disable_ipv6=1
# sysctl -p
# exit 0

# /etc/rc.local
#!/bin/sh -e
# chmod 777 /sys/class/backlight/intel_backlight/brightness
# exit 0
#sudo chmod +x /etc/rc.local

# install slack: change theme to haberdashery

# ~./fonts/install.sh

# sudo apt install gnome-calendar - online connections:

# 1722 dpkg, 8 snap, alias 8, export 44
# typeset: 1889t, compgen -abck: 4277, function: 85, function -kb: 168

# TODO: pulseaudio --kill && pulseaudio --start && sudo systemctl restart mpd
# TODO: mobidy fail on mpd
# TODO: mpd plays even though pulseaudio is unresponsive