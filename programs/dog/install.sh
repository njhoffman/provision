#!/bin/bash

mkdir -p ~/ghq/github.com/ogham && cd ~/ghq/github.com/ogham
git clone git@github.com:ogham/dog.git && cd dog
cargo install --path .
