#!/bin/bash

sudo apt install \
  python3-dpkt \
  python3-dnslib

# pip3 install visidata
pip3 install git+https://github.com/saulpw/visidata.git@develop

pip3 install --user \
  PyYAML \
  datapackage \
  dpkt \
  dnslib \
  fonttools \
  h5py \
  lxml \
  mapbox-vector-tile \
  numpy \
  openpyxl \
  pandas \
  pypng \
  pyshp \
  sas7bdat \
  savReaderWriter \
  xlrd \
  xport
