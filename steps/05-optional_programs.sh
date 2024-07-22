#!/bin/bash

dir="$HOME/ghq/github.com/njhoffman/provision/programs"

# npm packages
npm install -g \
  ctrace \
  devmoji \
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
  typescript \
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
go install github.com/jorgerojas26/lazysql@latest
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
  alacritty \
  alt \
  bandwhich \
  battop \
  broot \
  cargo-update \ # chr \
  devicon-lookup \
  dotenv-linter \
  du-dust \
  exa \
  eza \
  git-interactive-rebase-tool \
  glimmer \
  gpg-tui \
  grex \
  htmlq \
  httpie \
  id3-json \
  maple \
  mdcat \
  navi \
  ncspot \
  nu \
  nu_plugin_periodic_table \
  procs \
  selene \
  shellharden \
  so \
  spotify-tui \
  spotifyd \
  st \
  stylua \
  taskwarrior-tui \
  tealdeer \
  viu \
  xh \
  zenith \
  zeta-note \
  zoxide

"$dir/dust/install.cargo.sh"
"$dir/htmlq/install.cargo.sh"
"$dir/procs/install.cargo.sh"
"$dir/xh/install.cargo.sh"
cargo install update-all
# cargo custom list-versions command
cd ~/bin && cargo new cargo-list-versions --bin
# Cargo.toml dependencies
# reqwest = { version = "0.11.18", features = ["blocking", "json"] }
# serde_json = "1.0.96"
# main.rs:
# use std::env;
# fn main() {
#     if let Some(package_name) = env::args().nth(2) {
#         let client = reqwest::blocking::Client::builder()
#             .user_agent("YOUR_USER_AGENT")
#             .build()
#             .unwrap();
#         let api_url = format!(
#             "https://crates.io/api/v1/crates/{}/versions",
#             package_name.trim()
#         );
#         let resp = client
#             .get(api_url)
#             .send()
#             .unwrap()
#             .json::<serde_json::Value>()
#             .unwrap();
#         if let Some(installable_versions) = resp["versions"].as_array() {
#             for version in installable_versions {
#                 println!("{}", version["num"])
#             }
#         }
#     } else {
#         eprintln!("package name is missing")
#     }
# }
# cargo build --release
# cd build && cargo install --path .

# ruby gems
"$dir/mdless/install.gem.sh"

# asdf python dependencies
# sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
# libbz2-dev libreadline-dev libsqlite3-dev curl git \
# libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# asdf install python latest
# pip install pipx
pipx install --install-dep neovim-remote
pip install neovim
pipx install neovim-remote

# python packages
"$dir/flashfocus/install.pip.sh" || pipx install flashfocus
"$dir/vis/install.pip.sh"
"$dir/visidata/install.pip.sh" || pipx install visidata
"$dir/spotdl/install.pip.sh" || pipx install spotdl
# $dir/bpytop/install.pip.sh
# $dir/ueberzug/install.pip.sh || pipx install ueberzug
pipx install pgcli
pipx install mycli
pipx install youtube-dl
pipx install howdoi
pipx install assume
pipx install tuir
pipx install saws
# pipx install command-not-found
pip install pynvim
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
