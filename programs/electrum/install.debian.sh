#!/bin/bash

sudo apt install \
  python3-qrcode \
  python3-dnspython \
  python3-pip \
  python3-setuptools \
  python3-aiorpcx \
  python3-pyqt5 \
  libsecp256k1-dev

# TODO: dynamically get latest version

pip3 install https://download.electrum.org/4.2.2/Electrum-4.2.2.tar.gz
