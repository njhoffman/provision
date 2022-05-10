#!/bin/bash
# rethinkdb

# package building on stretch is broken: https://github.com/rethinkdb/rethinkdb-legacy/issues/6228
cd /usr/local/src
wget https://github.com/srh/rethinkdb/releases/download/v2.3.6.srh.1/rethinkdb_2.3.6.srh.1.0stretch_amd64.deb
dpkg -i rethinkdb_2.3.6.srh.1.0stretch_amd64.deb
# or
# wget http://mirrors.kernel.org/ubuntu/pool/main/p/protobuf/libprotobuf9v5_2.6.1-1.3_amd64.deb
# sudo dpkg -i libprotobuf9v5_2.6.1-1.3_amd64.deb
systemctl enable rethinkdb.service
systemctl start rethinkdb.service

# apt-get install build-essential protobuf-compiler python libprotobuf-dev libcurl4-openssl-dev libboost-all-dev libncurses5-dev libjemalloc-dev wget m4
# wget https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz
# tar xf rethinkdb-2.3.6.tgz
# cd rethinkdb-2.3.6
# ./configure --allow-fetch
# make
# make install
# echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" | tee /etc/apt/sources.list.d/rethinkdb.list
# wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
# apt-get update
# apt-get install rethinkdb

