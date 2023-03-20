#!/bin/bash

ghq get -l https://github.com/cortex/ripasso

sudo apt install cargo libgtk-3-dev qtdeclarative5-dev libqt5svg5-dev cmake libncurses-dev libncursesw5-dev libssl-dev libgpgme-dev libxcb-xfixes0-dev libxcb-shape0-dev nettle-dev
cargo build -p ripasso-cursive
# cargo build -p ripasso-gt && cd qlm && cargo run
# cargo build -p ripasso-gtk
# cargo build --all
