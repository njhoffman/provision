#!/bin/bash

### install optional programs
# go packages
go install golang.org/x/tools/gopls@latest

# random language specific packages
pip-upgrade-all
cargo install update-all

# npm packages
npm install -g github-files-fetcher ctrace hexdump hue-cli how-2 jira-cli jira lua-fmt markdownlint-cli mdr \
  neovim ngrok nodemon npm-check pwmetrics stylelint speedometer tldr tree-sitter-cli \
  tracerbench twilio-cli ultra-runner webtorrent-cli yt-play-cli yt-search

# go packages
go install golang.org/x/tools/gopls@latest

# random language specific packages
pip-upgrade-all
cargo install update-all

~/ghq/github.com/njhoffman/provision/programs/ctrace/install.npm.sh

# ├── prettyfile@1.0.0 -> ./../../../../../../ghq/github.com/njhoffman/prettyfile

~/ghq/github.com/njhoffman/provision/programs/curlie/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/ergo/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/golang-migrate/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/pup/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/scc/install.go.sh
~/ghq/github.com/njhoffman/provision/programs/jira-cli/install.go.sh

~/ghq/github.com/njhoffman/provision/programs/dust/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/htmlq/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/procs/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/xh/install.cargo.sh

~/ghq/github.com/njhoffman/provision/programs/colorls/install.gem.sh
~/ghq/github.com/njhoffman/provision/programs/mdless/install.gem.sh

~/ghq/github.com/njhoffman/provision/programs/vis/install.pip.sh
~/ghq/github.com/njhoffman/provision/programs/visidata/install.pip.sh
# ~/ghq/github.com/njhoffman/provision/programs/bpytop/install.pip.sh
# ~/ghq/github.com/njhoffman/provision/programs/ueberzug/install.pip.sh

~/ghq/github.com/njhoffman/provision/programs/btop/install.sh
~/ghq/github.com/njhoffman/provision/programs/dog/install.sh
~/ghq/github.com/njhoffman/provision/programs/glow/install.sh
~/ghq/github.com/njhoffman/provision/programs/mainline/install.sh
~/ghq/github.com/njhoffman/provision/programs/ytfzf/install.sh
# ~/ghq/github.com/njhoffman/provision/programs/navi/install.cargo.sh
~/ghq/github.com/njhoffman/provision/programs/ntfd/install.sh
~/ghq/github.com/njhoffman/provision/programs/pass/install.sh
~/ghq/github.com/njhoffman/provision/programs/timewarrior/install.sh

~/ghq/github.com/njhoffman/provision/programs/duf/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/feh/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/glances/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/googler/install.sh
~/ghq/github.com/njhoffman/provision/programs/nitrogen/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/nnn/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/ranger/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/taskwarrior/install.debian.sh
~/ghq/github.com/njhoffman/provision/programs/zathura/install.debian.sh
