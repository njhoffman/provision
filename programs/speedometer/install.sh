#!/bin/bash

sudo apt-get install speedometer

netstat -t -u -c
for i in {1..60}; do
  echo "$(ifconfig eth0 | grep X.pa)"
  sleep 1
done
speedometer -i 0.5 -l -rx wlp0s20f3 -tx wlp0s20f3
# -m $((1024 * 1024 * 3 / 2))
