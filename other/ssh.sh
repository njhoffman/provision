#!/bin/bash

# install and enable ssh server
sudo apt install openssh-server
sudo systemctl enable ssh
sudo ufw allow ssh
