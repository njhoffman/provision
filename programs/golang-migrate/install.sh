#!/bin/bash

ghq get -l https://github.com/golang-migrate/migrate
make
install migrate ~/.local/bin/migrate
