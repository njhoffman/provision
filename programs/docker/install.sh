#!/bin/bash

# curl -fsSL https://get.docker.com -o get-docker.sh
# DRY_RUN=1 sh ./get-docker.sh

sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

pip3 install docker-compose
