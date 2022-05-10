#!/bin/bash

sudo apt-get install -y gpg-agent wget
wget -qO - https://repositories.intel.com/graphics/intel-graphics.key \
  | sudo apt-key add -
sudo apt-add-repository \
  'deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu focal main'

sudo apt-get update
sudo apt-get install \
  intel-opencl-icd \
  intel-level-zero-gpu level-zero \
  intel-media-va-driver-non-free libmfx1

sudo apt-get install \
  intel-gpu-overlay \
  libigc-dev \
  intel-igc-cm \
  libigdfcl-dev \
  libigfxcmrt-dev \
  level-zero-dev

# In order to access GPU capabilities, a user needs to have the correct permissions on system. The following will list the group assigned ownership of the render nodes, and list the groups the active user is a member of:
stat -c "%G" /dev/dri/render*
groups ${USER}

# If a group is listed for the render node which isn’t listed for the user, you will need to add the user to the group using gpasswd. In the following, the active user will be added to the ‘render’ group and a new shell spawned with that group active:
sudo gpasswd -a ${USER} render
newgrp render
