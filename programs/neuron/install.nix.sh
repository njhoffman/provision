#!/bin/bash

curl -L https://nixos.org/nix/install | sh
source ~/.nix-profile/etc/profile.d/nix.sh
nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix use srid
nix-env -if https://github.com/srid/neuron/archive/master.tar.gz
# cd ~/zettelkasten && neuron gen

# emanote
nix-env -if https://github.com/srid/emanote/archive/refs/heads/master.tar.gz
# cd /path/to/notebook
# emanote --host=0.0.0.0 --port=8001

# # Generate static files (-L defaults to current directory)
# mkdir /tmp/output
# emanote -L /path/to/notebook gen /tmp/output
