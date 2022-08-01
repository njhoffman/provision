#!/bin/bash
# https://github.com/lucapette/fakedata/raw/main/README.md
ghq get -l lucapette/fakedata
make
install fakedata ~/.local/bin
