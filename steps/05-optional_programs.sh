#!/bin/bash

dir="$HOME/ghq/github.com/njhoffman/provision/programs"

# npm packages
npm install -g \
  ctrace \
  fast-cli \
  github-files-fetcher \
  hexdump \
  how-2 \
  hue-cli \
  jira \
  jira-cli \
  lua-fmt \
  markdownlint-cli \
  mdr \
  neovim \
  ngrok \
  nodemon \
  npm-check \
  pwmetrics \
  speedometer \
  stylelint \
  tldr \
  tracerbench \
  tree-sitter-cli \
  twilio-cli \
  ultra-runner \
  webtorrent-cli \
  yt-play-cli \
  yt-search

# go packages
go list std
go install golang.org/x/tools/gopls@latest
go install golang.org/x/cmd/govulncheck@latest
go list -m
ls "$GOPATH"/go "$GOROOT"/bin
# callgraph curlie dlv ergo go gofmt goimports gomvp gopls gorename gotestsum guru impl jqp json-to-struct mockgen pup scc
# curl -fsSL "https://github.com/abice/go-enum/releases/download/v0.5.5/go-enum_$(uname -s)_$(uname -m)" -o ~/.local/bin/go-enum && chmod +x ~/.local/bin/go-enum

# callgraph@latest \

# github.com/mcandre/stank@latest \
# github.com/motemen/gore/cmd/gore@latest \
# github.com/PuerkitoBio/goquery@latest \
go install github.com/antonmedv/fx@latest
go install github.com/mrtazz/checkmake/cmd/checkmake@latest
go install github.com/eh-am/i3-tree@latest
go install github.com/kyoh86/richgo@latest
go install github.com/noahgorstein/jqp@latest
go install github.com/tigrawap/slit/cmd/slit@latest
go install github.com/jesseduffield/lazynpm@latest
go install github.com/gcla/termshark/v2/cmd/termshark@latest
go install github.com/go-delve/delve/cmd/dlv@latest
"$dir/curlie/install.go.sh"
"$dir/ergo/install.go.sh"
"$dir/golang-migrate/install.go.sh"
"$dir/pup/install.go.sh"
"$dir/scc/install.go.sh"
"$dir/jira-cli/install.go.sh"
# ├── prettyfile@1.0.0 -> ./../../../../../../ghq/github.com/njhoffman/prettyfile

# cargo packages
cargo install \
  alt \
  broot \
  cargo-update \ # chr \
  devicon-lookup \
  dotenv-linter \
  exa \
  maple \
  navi \
  spotify-tui \
  spotifyd \
  st \
  stylua \
  taskwarrior-tui \
  tealdeer \
  zeta-note \
  zoxide
"$dir/dust/install.cargo.sh"
"$dir/htmlq/install.cargo.sh"
"$dir/procs/install.cargo.sh"
"$dir/xh/install.cargo.sh"
cargo install update-all

# ruby gems
"$dir/colorls/install.gem.sh"
"$dir/mdless/install.gem.sh"

# python packages
"$dir/flashfocus/install.pip.sh"
"$dir/vis/install.pip.sh"
"$dir/visidata/install.pip.sh"
"$dir/spotdl/install.pip.sh"
# $dir/bpytop/install.pip.sh
# $dir/ueberzug/install.pip.sh
pipx install pgcli
pipx install mycli
pipx install youtube-dl
pipx install howdoi
pipx install assume
# pipx install command-not-found
pip3 install pynvim
pip-upgrade-all

"$dir/btop/install.sh"
"$dir/dog/install.sh"
"$dir/glow/install.sh"
"$dir/mainline/install.sh"
"$dir/ytfzf/install.sh"
# $dir/navi/install.cargo.sh
"$dir/ntfd/install.sh"
"$dir/pass/install.sh"
"$dir/timewarrior/install.sh"

"$dir/duf/install.debian.sh"
"$dir/feh/install.debian.sh"
"$dir/glances/install.debian.sh"
"$dir/googler/install.sh"
"$dir/nitrogen/install.debian.sh"
"$dir/nnn/install.debian.sh"
"$dir/ranger/install.debian.sh"
"$dir/taskwarrior/install.debian.sh"
"$dir/zathura/install.debian.sh"

# random packages and config
#   init njhoffman gh repos (special: zettelkasten)
#   uninstall snap packages (firefox)
#   scan ~/bin and install dependencies
# fzf post-install: ghq get -l junegunn/fzf && cp -rv man/man1/* /usr/share/man/man1 && mandb
touch ~/.config/nitrogen/bg-saved.cfg

"$dir/gh-cli/install.extensions.sh"

sudo add-apt-repository ppa:micahflee/ppa # release focal
sudo apt install torbrowser-launcher
# settings -> themes -> dark mode
