#!/usr/bin/env bash

# install jdk 11
sudo
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add -
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
sudo apt-get update
sudo apt-get install -y java-11-amazon-corretto-jdk

# direct download
# wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz

java --version
# if not Corretto version change default programs
sudo update-alternatives --config java
sudo update-alternatives --config javac
