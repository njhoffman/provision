#!/bin/bash

ghq get -l FauxFaux/most-pager
./configure
make && sudo make install
