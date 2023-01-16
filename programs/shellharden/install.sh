#!/bin/bash

ghq get -l https://github.com/anordal/shellharden
  cargo install shellharden
cargo build --release
mv target/release/shellharden ~/.local/bin/

cargo test
# Test coverage
env RUSTFLAGS="-C instrument-coverage" LLVM_PROFILE_FILE='run-%m.profraw' cargo test
grcov . --binary-path ./target/debug/ -s . -t html -o ./coverage/
rm run-*.profraw
# open coverage/src/index.html
# Fuzz test
cargo install afl
cargo afl build --release
cargo afl fuzz -i moduletests/original -o /tmp/fuzz-shellharden target/release/shellharden '@@'
