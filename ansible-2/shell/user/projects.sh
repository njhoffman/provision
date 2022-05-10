#!/bin/bash

# projects
mkdir -p /home/$USER/projects
cd /home/$USER/projects
git clone https://github.com/njhoffman/better-musician.git
cd better-musician && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/better-musician-api.git
cd better-musician-api && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/prettyjson-256.git
cd prettyjson-256 && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/debugger-256.git
cd debugger-256 && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/powerlevel9k.git
cd powerlevel9k && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/powerlevel9k.git
cd powerlevel9k && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/goConfig.git
cd goConfig && npm install

cd /home/$USER/projects
git clone https://github.com/njhoffman/musicman.git
cd musicman/client && npm install
cd ../server && npm install

