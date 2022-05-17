#!/bin/bash

# install core utils, zsh
sudo apt install add-apt-key bison byacc build-essential git keychain locate manpages-dev pkg-config zsh # autotools-dev automake
# install core dev libs
sudo apt install libssl-dev libreadline-dev libsqlite3-dev libbz2-dev libevent-dev zlib1g-dev
# install network utils
sudo apt install \
  blueman cifs-utils curl net-tools nmap smbclient traceroute \
  nfs-common # : lockd, statd, showmount, nfsstat, gssd, idmapd and mount.nfs.
# install avahi utils
sudo apt install avahi-autoipd avahi-daemon avahi-discover avahi-utils
# install python and python packages
sudo apt install python python-is-python3 python3-pip python-setuptools
# install x11 utils
sudo apt install xsel xclip xdotool wmctrl
# install random utils
sudo apt install autorandr ccze fasd grc jq sqlite3 thefuck ubuntu-restricted-extras wdiff

# add ssh key to github, clone provision
ssh-keygen && ssh -T rsa -C 'njhoffman1982@gmail.com' && ssh-add -l -E sha256
eval "$(ssh-agent -s)" && ssh -add -l -E md5
mkdir -p ~/ghq/github.com/njhoffman && cd ~/ghq/github.com/njhoffman && git clone git@github.com:njhoffman/provision.git

# install dotbare, clone dotbare
git clone https://github.com/kazhala/dotbare.git ~/.dotbare
export PATH=$PATH:$HOME/.dotbare
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"
dotbare finit -u https://github.com/njhoffman/dotfiles.git

# clone asdf, install plugins and programs
# asdf pre: sudo apt install re2c uuid-dev libxml2-dev icu-doc
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf-install-missing-plugins
asdf-install-missing-versions # (read custom pre-install and post-install hooks)

# clone histdb
rm -rfv ~/.histdb && git clone git@github.com:njhoffman/zsh-history.git ~/.histdb

# log into zsh for zinit initialization
mkdir ~/.local/man/ && sudo chsh /bin/zsh && /bin/zsh

# install fonts
mkdir -p ~/ghq/github.com/ryanoasis && cd ~/ghq/github.com/ryanoasis && git clone git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts && ./install.sh

# random language specific packages
pip-upgrade-all
cargo install update-all

# install essential programs
~/ghq/github.com/njhoffman/provision/programs/alacritty/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/autokey/install.sh
# ~/ghq/github.com/njhoffman/provision/programs/chrome/install.sh
~/ghq/github.com/njhoffman/provision/programs/i3/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/kitty/install.sh
~/ghq/github.com/njhoffman/provision/programs/neuron/install.nix.sh
~/ghq/github.com/njhoffman/provision/programs/nvenv/install.sh
~/ghq/github.com/njhoffman/provision/programs/nvimpager/install.sh
~/ghq/github.com/njhoffman/provision/programs/picom/install.sh
~/ghq/github.com/njhoffman/provision/programs/polybar/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/rofi/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/tmux/install.sh
~/ghq/github.com/njhoffman/provision/programs/tmuxp/install.sh
~/ghq/github.com/njhoffman/provision/programs/wezterm/install.debian.sh

# install optional programs
~/ghq/github.com/njhoffman/provision/programs/bpytop/install.pip.sh
~/ghq/github.com/njhoffman/provision/programs/colorls/install.gem.sh
~/ghq/github.com/njhoffman/provision/programs/ctrace/install.npm.sh
~/ghq/github.com/njhoffman/provision/programs/curlie/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/dog/install.sh
~/ghq/github.com/njhoffman/provision/programs/duf/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/dust/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/glances/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/googler/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/glow/install.sh
~/ghq/github.com/njhoffman/provision/programs/htmlq/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/mainline/install.sh
~/ghq/github.com/njhoffman/provision/programs/mdless/install.gem.sh
# ~/ghq/github.com/njhoffman/provision/programs/navi/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/nitrogen/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/ntfd/install.sh
~/ghq/github.com/njhoffman/provision/programs/pass/install.sh
~/ghq/github.com/njhoffman/provision/programs/procs/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/pup/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/taskwarrior/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/timewarrior/install.sh
~/ghq/github.com/njhoffman/provision/programs/ueberzug/install.pip.sh
~/ghq/github.com/njhoffman/provision/programs/vis/install.pip.sh
~/ghq/github.com/njhoffman/provision/programs/visidata/install.pip.sh
~/ghq/github.com/njhoffman/provision/programs/xh/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/ytfzf/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/zathura/install.debian.sh
# random init
~/ghq/github.com/njhoffman/provision/programs/gh-cli/install.extensions.sh
bat cache --build

#   init njhoffman gh repos (special: zettelkasten)
#   uninstall snap packages (firefox)
#   scan ~/bin and install dependencies

# fzf post-install: ghq get -l junegunn/fzf && cp -rv man/man1/* /usr/share/man/man1 && mandb

sudo apt install mpd mpc
ln -s ~/.config/mpd/mpd.conf
# cp /etc/pulse/default.pa

# docker post-install: usermod -aG docker nicholas && docker build whalesay/whalesay

touch ~/.config/nitrogen/bg-saved.cfg
sudo apt install nitrogen
sudo apt install flashfocus # systemctl --user start flashfocus.service && systemctl --user enable flashfocus.service

sudo add-apt-repository ppa:micahflee/ppa # release focal
sudo apt install torbrowser-launcher
# settings -> themes -> dark mode

npm install -g github-files-fetcher

# install wallpapers
git clone git@github.com:njhoffman/resources-wallpaper.git ~/wallpaper

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
