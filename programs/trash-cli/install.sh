#!/bin/bash

git clone https://github.com/andreafrancia/trash-cli.git
cd trash-cli
# sudo python setup.py install
# sudo python setup.py install --user linuxlala
(
  crontab -l
  echo "@daily $(which trash-empty) 30"
) | crontab -
