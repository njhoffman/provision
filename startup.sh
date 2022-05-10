#!/bin/bash

# steps:
#   install core utils, zsh
#   add ssh key to github
#   install dotbare
#   install fonts
#   uninstall snap packages (firefox)
#   log into zsh, zinit initializes asdf
#   asdf-install-missing-plugins
#   asdf-install-missing-versions (read custom pre-install and post-install hooks)
#   install select program scripts
#   init njhoffman gh repos (special: zettelkasten, zsh-histdb)
#   scan ~/bin and install dependencies

# random apt:
#  neofetch \
#  xclip \
#  xsel \
#  grc \
#  jq \
#  fasd \
#  samba-client \
#  cifs-utils \
#  net-tools \
#  blueman \
#  blueman-manager \
#  nmap \
#  autorandr \
#  wmctrl \
#  xdotool
sudo apt install ubuntu-restricted-extras
sudo apt install mkvtoolnix
# mkvmerge -o outfile.mkv infile_01.mp4 \+ infile_02.mp4 \+ infile_03.mp4

sudo apt install python-is-python3

export PATH=$PATH:$HOME/.dotbare
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"
dotbare finit -u https://github.com/njhoffman/dotfiles.git

# alacritty
sudo add-apt-repository ppa:aslatter/ppa
sudo apt install alacritty xsel

# setup ssh key
ssh-keygen && ssh -T rsa -C 'njhoffman1982@gmail.com' && ssh-add -l -E sha256
eval "$(ssh-agent -s)" && ssh -add -l -E md5
# TODO: add key to github and bitbucket accounts

# asdf (zinit handles!)
sudo apt install curl git gcc autotools-dev libssl-dev zlib1g-dev add-apt-key keychain libreadline-dev libsqlite3-dev libbz2-dev make automake libevent-dev bison byacc
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
asdf plugin add ghq && asdf install ghq latest

# fzf post-install: ghq get -l junegunn/fzf && cp -rv man/man1/* /usr/share/man/man1 && mandb

# rofi, rofi-themes ~/.local/share/rofi/themes/
# apt install rofi

ghq get -l ryanoasis/nerd-fonts
./install.sh

sudo apt install xclip libpcre2-dev libpcre3-dev nnn
ghq get -l https://github.com/vlang/v
ghq get -l https://github.com/NTBBloodbath/nvenv
mkdir -p ~/.vim/sessions/restart ~/.vim/sessions/saved
pip3 install --user neovim-remote tasklib
# inside vim - LspInstall,
# sudo apt install python3.10-venv

pip3 install tmuxp

sudo apt install mpd mpc
ln -s ~/.config/mpd/mpd.conf
pip3 install vis
# cp /etc/pulse/default.pa

# docker post-install: usermod -aG docker nicholas && docker build whalesay/whalesay

touch ~/.config/nitrogen/bg-saved.cfg
sudo apt install nitrogen
sudo apt install picom
sudo apt install flashfocus # systemctl --user start flashfocus.service && systemctl --user enable flashfocus.service

sudo apt install avahi-autoipd avahi-daemon avahi-discover avahi-utils

sudo add-apt-repository ppa:micahflee/ppa # release focal
sudo apt install torbrowser-launcher
# settings -> themes -> dark mode

npm install -g github-files-fetcher

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

# sudo apt install gnome-calendar - online connections:

# 1722 dpkg, 8 snap, alias 8, export 44
# typeset: 1889t, compgen -abck: 4277, function: 85, function -kb: 168

# TODO: pulseaudio --kill && pulseaudio --start && sudo systemctl restart mpd
# TODO: mobidy fail on mpd
# TODO: mpd plays even though pulseaudio is unresponsive
