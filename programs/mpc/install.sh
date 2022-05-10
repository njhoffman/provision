#!/bin/bash

ghq get -l MusicPlayerDaemon/mpc
meson . output
ninja -C output
ninja -C output install
