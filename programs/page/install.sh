#!/usr/bin/env bash

# https://github.com/I60R/page
# https://github.com/I60R/page/releases/download/v4.6.3/binaries-ubuntu.zip

ghq get I60R/page.git && cd ~/ghq/github.com/I60R/page && cargo install --path .
