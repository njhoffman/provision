#!/bin/bash

cd ~/Downloads
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall \
  && chmod 755 msfinstall \
  && ./msfinstall

mkdir metasploitable3-workspace \
  && cd metasploitable3-workspace \
  && curl -O https://raw.githubusercontent.com/rapid7/metasploitable3/master/Vagrantfile \
  && vagrant up
