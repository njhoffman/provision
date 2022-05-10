#!/bin/bash

ghq get -l https://github.com/ogham/dog
cargo build
cargo install --path .
