#!/bin/bash

ghq get -l https://github.com/gwsw/less
autoconf
./configure
make -f Makefile.aut distfiles
