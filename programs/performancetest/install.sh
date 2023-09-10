#!/bin/bash
sudo apt install libncurses5
cd ~/Downloads && wget https://www.passmark.com/downloads/pt_linux_x64.zip
unzip pt_linux_x64.zip && sudo mv PerformanceTest/pt_linux_x64 /usr/local/bin/pt
