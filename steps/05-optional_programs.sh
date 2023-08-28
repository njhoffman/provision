#!/bin/bash

dir="$HOME/ghq/github.com/njhoffman/provision/programs"

# npm packages
npm install -g \
  ctrace \
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
go list -m
ls "$GOPATH"/go "$GOROOT"/bin
# callgraph curlie dlv ergo go gofmt goimports gomvp gopls gorename gotestsum guru impl jqp json-to-struct mockgen pup scc
# curl -fsSL "https://github.com/abice/go-enum/releases/download/v0.5.5/go-enum_$(uname -s)_$(uname -m)" -o ~/.local/bin/go-enum && chmod +x ~/.local/bin/go-enum
go install \
  callgraph@latest \
  golang.org/x/vuln/cmd/govulncheck@latest \
  github.com/antonmedv/fx@latest \
  github.com/boyter/scc@latest \
  github.com/rs/curlie@latest \
  github.com/cristianoliveira/ergo@latest \
  github.com/ericchiang/pup@latest \
  github.com/mrtazz/checkmake/cmd/checkmake@latest \
  github.com/eh-am/i3-tree@latest \
  github.com/kyoh86/richgo@latest \
  github.com/noahgorstein/jqp@latest \
  github.com/ankitpokhrel/jira-cli/cmd/jira@latest \
  golang.org/x/tools/gopls@latest \
  github.com/ankitpokhrel/jira-cli/cmd/jira@latest \
  github.com/mcandre/stank@latest \
  github.com/tigrawap/slit/cmd/slit@latest \
  github.com/motemen/gore/cmd/gore@latest \
  github.com/jesseduffield/lazynpm@latest \
  github.com/gcla/termshark/v2/cmd/termshark@latest \
  github.com/PuerkitoBio/goquery@latest \
  github.com/go-delve/delve/cmd/dlv@latest \
  github.com/ankitpokhrel/jira-cli/cmd/jira@latest
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
  cargo-update \
  chr \
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
"$dir/vis/install.pip.sh"
"$dir/visidata/install.pip.sh"
# $dir/bpytop/install.pip.sh
# $dir/ueberzug/install.pip.sh
pip3 install youtube-dl howdoi assume command-not-found pynvim
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
bat cache --build
#   init njhoffman gh repos (special: zettelkasten)
#   uninstall snap packages (firefox)
#   scan ~/bin and install dependencies
# fzf post-install: ghq get -l junegunn/fzf && cp -rv man/man1/* /usr/share/man/man1 && mandb
touch ~/.config/nitrogen/bg-saved.cfg
sudo apt install nitrogen
sudo apt install flashfocus # systemctl --user start flashfocus.service && systemctl --user enable flashfocus.service

"$dir/gh-cli/install.extensions.sh"

sudo add-apt-repository ppa:micahflee/ppa # release focal
sudo apt install torbrowser-launcher
# settings -> themes -> dark mode
