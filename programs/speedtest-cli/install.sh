#!/bin/bash

curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip

sudo apt install speedtest-cli
speedtest-cli
