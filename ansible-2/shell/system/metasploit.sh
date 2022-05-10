#!/bin/bash

# add build repository and install metasploit package
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall \
  && chmod 755 msfinstall \
  && ./msfinstall \
  && msfconsole

# or install from source
# NOTE: need to install java8 jdk, nmap and rebenv prior

cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R `whoami` /opt/metasploit-framework
cd metasploit-framework

# If using RVM set the default gem set that is create when you navigate in to the folder
rvm --default use ruby-${RUBYVERSION}@metasploit-framework

gem install bundler
bundle install

sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

# install and run metasploit
wget https://gigenet.dl.sourceforge.net/project/metasploitable/Metasploitable2/metasploitable-linux-2.0.0.zip
