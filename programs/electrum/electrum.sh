#!/bin/bash

sudo apt install \
  python3-pip \
  python3-setuptools \
  python3-pyqt5 \
  libsecp256k1-dev

sudo -H pip3 install https://download.electrum.org/4.1.2/Electrum-4.1.2.tar.gz#egg=electrum[fast]
