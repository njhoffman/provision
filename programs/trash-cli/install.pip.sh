#!/bin/bash
pip uninstall trash-cli && sudo pip uninstall trash-cli # remove the previous version (with pip)
sudo apt-get remove trash-cli                           # remove the previous version (with apt)

pip install git+https://github.com/andreafrancia/trash-cli
pipx install trash-cli
