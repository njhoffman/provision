#!/bin/bash

# https://github.com/orhun/gpg-tui
https://github.com/orhun/gpg-tui/releases

sudo apt install librust-gpg-error-dev libpgpme-dev
# gpgme-sys
cargo install gpg-tui

# Building from source
# # clone the repository
# git clone https://github.com/orhun/gpg-tui.git && cd gpg-tui/
# # build and install
# cargo install --root "$HOME/.cargo" --path .

# Docker Hub
# See available tags. https://hub.docker.com/r/orhunp/gpg-tui/tags
# docker pull orhunp/gpg-tui:[tag]
# You can also use the following command for a quick launch:
# docker run --rm -it -v "$HOME/.gnupg":/app/.gnupg --user 1000:1000 orhunp/gpg-tui --homedir /app/.gnupg

# Using the Dockerfile
# # clone the repository
# git clone https://github.com/orhun/gpg-tui.git && cd gpg-tui/
# # build the image
# docker build -t gpg-tui .
# # run the container
# docker run -it gpg-tui
# Fr
