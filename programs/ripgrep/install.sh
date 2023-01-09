#!/bin/bash

 ghq get -l BurntSushi/ripgrep
 cargo build --release
 sudo install ./target/release/rg /usr/local/bin/rg

