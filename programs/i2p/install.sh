#!/bin/bash

url="http://www.i2p2.de/en/download/2.0.0/clearnet/https/download.i2p2.no/i2psource_2.0.0.tar.bz2/download"
cd "$HOME/Downloads"
wget "$url"
tar "xjvf i2psource_2.0.0.tar.bz2"
cd "i2p-2.0.0"
ant pkg
