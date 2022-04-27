#!/bin/bash

curl https://sh.rustup.rs -sSf | sh -s
curl -LO https://github.com/wez/wezterm/releases/download/20220408-101518-b908e2dd/wezterm-20220408-101518-b908e2dd-src.tar.gz
tar -xzf wezterm-20220408-101518-b908e2dd-src.tar.gz
cd wezterm-20220408-101518-b908e2dd
./get-deps
cargo build --release
cargo run --release --bin wezterm -- start
