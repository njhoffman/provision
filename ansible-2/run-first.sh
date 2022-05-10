#!/bin/bash

apt-get update
apt-get install -y \
  software-properties-common \
  git \
  python3

# might have to replace dist in sources.list.d if on bleeding edge distro
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible



