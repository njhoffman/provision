#!/bin/bash

rustup update stable

cargo install bottom --locked

# Alternatively, --locked may be omitted if you wish to not used locked dependencies:
cargo install bottom
