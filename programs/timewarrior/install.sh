#!/bin/bash

sudo apt install timewarrior
# nix-env --install timewarrior

# Prerequisites
# To build Timewarrior from the tarball you will need these tools:

# cmake
# make
# C++ compiler with full C++14 support, currently gcc 6.1+ or clang 3.4+
# Python 3 (optional, only required for running the test suite)
# Asciidoctor (optional, only required for re-building man pages)
# Download
# The release tarballs are hosted on GitHub. You can download the tarball with curl, as an example of just one of many ways to download the tarball.

# $ curl -L -O https://github.com/GothenburgBitFactory/timewarrior/releases/download/v1.4.3/timew-1.4.3.tar.gz
# Build & Install
# Expand the tarball, build Timewarrior, and install it. This copies files into the right place, and installs man pages.

# $ tar xzf timew-1.4.3.tar.gz
# $ cd timew-1.4.3
# $ cmake -DCMAKE_BUILD_TYPE=Release .
# ...
# $ make
# ...
# $ sudo make install
