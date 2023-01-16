#!/bin/bash

ghq get -l BurntSushi/ripgrep
$ cargo build --release --features 'pcre2'
sudo install ./target/release/rg /usr/local/bin/rg
