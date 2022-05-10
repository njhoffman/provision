#!/usr/bin/env bash

# export VAGRANT_DETECTED_OS=cygwin

apt-get update
apt-get upgrade
apt-get install -y libncurses5
apt-get install -y libncurses5-dev
apt-get install -y libevent-dev
apt-get install -y make
apt-get install -y git
apt-get install -y mercurial
apt-get install -y curl
apt-get install -y zip
apt-get install -y gdb
apt-get install -y exuberant-ctags
apt-get install -y python
apt-get install -y python-dev
apt-get install -y python3
apt-get install -y python3-dev
apt-get install -y ruby
apt-get install -y ruby-dev
apt-get install -y libx11-dev
apt-get install -y libxt-dev
apt-get install -y libgtk2.0-dev

#pull from git resources
# cp /vagrant/resources/.bashrc_user /home/vagrant
# cp /vagrant/resources/.bash_functions /home/vagrant
# echo '. "${HOME}/.bashrc_user"' >> /home/vagrant/.bashrc
# mkdir /home/vagrant/bin
# cp -rv /vagrant/resources/bin/* /home/vagrant/bin

mkdir -p /home/vagarant/local/src

# tmux
cd /home/vagrant/local/src
wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
tar xzvf tmux-2.2.tar.gz
cd tmux-2.2
./configure
make
make install

# vim
cd /home/vagrant/local/src
mkdir git
cd git
git clone https://github.com/vim/vim.git
cd vim/src
make
make install

#./configure \
#    --enable-pythoninterp \
#    --enable-rubyinterp \
#    --enable-cscope \
#    --with-features=huge \
#    --with-python-config-dir=/usr/lib/python2.7/config
#make
#make install
#cp \
#    /vagrant/resources/.vimrc \
#    /vagrant/resources/.vimrc.plugins \
#    /vagrant/resources/.vimrc.functions \
#    /home/vagrant
 mkdir /home/vagrant/.vim
# cp -rf /vagrant/resources/.vim/* /home/vagrant/.vim
cd /home/vagrant/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git
#cp /vagrant/resources/.vim/bundle/vim-airline/autoload/airline/themes/hoffman.vim /home/vagrant/.vim
mkdir -p /home/vagrant/.vim-tmp/backup
mkdir -p /home/vagrant/.vim-tmp/swap


# node/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
nvm install 5.0
nvm use 5.0

# curl -sL https://deb.nodesource.com/setup | bash -

# apt-get install -y nodejs
#apt-get install -y build-essential
#npm set strict-ssl false
npm update
npm install -g pm2
npm install -g express
npm install -g browserify

#ssh keep alive
sed -i 's/^Host \*/Host *\n\tServerAliveInterval 300\n\tServerAliveCountMax 2/g' /etc/ssh/ssh_config

#time zone config
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime

# misc
chown -R vagrant /home/vagrant
chgrp -R vagrant /home/vagrant


# projects
mkdir /home/vagrant/projects

# proofme
cd /home/vagrant/projects
git clone git@bitbucket.org:metacommunications/boostrap-server.git
git clone git@bitbucket.org:metacommunications/proofme.git
cd proofme
npm install

# sysmonitors
curl -L https://bit.ly/glances | /bin/bash

# java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install oracle-java8-installer


# elasticsearch/logstash
curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.2/elasticsearch-2.3.2.tar.gz
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
