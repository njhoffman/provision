#!/usr/bin/env bash

# jessie vagrant setup

export VAGRANT_DETECTED_OS=cygwin

# add vagrant user to staff group
usermod -a -G staff vagrant

apt-get update
apt-get upgrade -y
apt-get install init-system-helpers # for docker backport

# terminal library for vim
apt-get install -y libncurses5-dev
# tmux requires libevent 2.x
apt-get install -y libevent-dev
# linux-tools contains diagnostic utilities like perf, cpupower
apt-get install -y linux-tools
# python necessary for youcompleteme vim plugin
apt-get install -y python-dev python-pip
# automake autotools-dev pkg-config needed for compiling tmux
apt-get install -y pkg-config autotools-dev automake

# nginx
apt-get install -y nginx

# compression
apt-get install -y zip

# revision tracking
apt-get install -y mercurial git

# networking tools
apt-get install -y  nmap

# development
apt-get install -y ruby ruby-dev python3 python3-dev python python-dev
apt-get install -y make g++ curl cmake
pip install ipython

#gdb
apt-get install -y libc6-dbg gdb valgrind

# vim
mkdir -p /home/vagrant/.vim-tmp/backup
mkdir -p /home/vagrant/.vim-tmp/swap
cd /usr/local/src
git clone https://github.com/vim/vim.git
cd vim/src
./configure --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config
make
make install
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git /home/vagrant/.vim/bundle/YouCompleteMe
cd /home//vagrant/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py --clang-completer
vim +PluginInstall +qall
vim +GoInstalLBinaries +qall
# todo: find a way to actually install plugins, above doesn't work
# todo: npm install tern_for_vim
# cp ~/custom-resources/.vim/bundle-post/vim-airline-themes/autoload/airline/themes/hoffman.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/

# vim pager
cd /usr/local/src
git clone https://github.com/rkitover/vimpager
cd vimpager
make install-deb

# java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install oracle-java8-installer

# elasticsearch
# logstash
# kibana

# influxdb
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/os-release
test $VERSION_ID = "7" && echo "deb https://repos.influxdata.com/debian wheezy stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
test $VERSION_ID = "8" && echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#apt-get update && sudo apt-get install influxdb
#service influxdb start
apt-get update && sudo apt-get install influxdb
systemctl start influxdb

# grafana
deb https://packagecloud.io/grafana/stable/debian/ jessie main
curl https://packagecloud.io/gpg.key | sudo apt-key add -
apt-get update
apt-get install grafana
#grafana-server start
systemctl enable grafana-server.service

# collectd
apt-get install build-essential
cd /usr/local/src
wget https://collectd.org/files/collectd-5.7.1.tar.bz2
tar -jxf collectd-5.7.1.tar.bz2
cd collectd-5.7.1
./configure
make all install
wget -O /etc/init.d/collectd https://raw.githubusercontent.com/martin-magakian/collectd-script/master/collectd.init
chmod 744 /etc/init.d/collectd
#service collectd start
update-rc.d grafana-server defaults
systemctl enable grafana-server.service
# create collectd database in influx
curl -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE collectd"
# need to edit collectd and influxdb conf files,
# collectd conf file:
#Hostname "localhost"
#TypesDB "/usr/local/share/collectd/types.db"
#Interval 5
#ReadThreads 5
#<Plugin network> Server "127.0.0.1" "25826"</Plugin>
# influxdb conf file:
#[[collectd]]
#  enabled = true
#  bind-address = "127.0.0.1:25826"
#  database = "collectd"
#  # The collectd service supports either scanning a directory for multiple types
#  # db files, or specifying a single db file.
#  typesdb = "/usr/local/share/collectd/types.db"
# sudo tcpdump -i lo -p -n dst port 25826

#statsd -- shouldn't need, use collectd plugin
#cd /usr/local/src
#git clone https://github.com/etsy/statsd
#cp -rv statsd /opt
#cd /opt/statsd
#npm install
#npm install statsd-influxdb-backend
# gyp failed with exit code 1

# projects
mkdir /home/vagrant/projects
cd /home/vagrant/projects
git clone https://github.com/njhoffman/prettyjson-256
git clone https://github.com/njhoffman/debugger-256
git clone https://bitbucket.com/njhoffman/es-navigator
git clone https://bitbucket.com/njhoffman/instrumental
git clone https://bitbucket.com/njhoffman/instrumental-api
# git clone https://bitbucket.com/njhoffman/algorithmia
#mkdir /home/vagrant/projects/learning
c#d /home/vagrant/projects/learning
#git clone https://github.com/Unitech/pm2
#git clone https://github.com/expressjs/express
#git clone https://github.com/reactjs/redux

#ssh keep alive
sed -i 's/^Host \*/Host *\n\tServerAliveInterval 300\n\tServerAliveCountMax 2/g' /etc/ssh/ssh_config

#time zone config
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime

# pull custom resources from bitbucket
cd /home/vagrant
git clone https://njhoffman@bitbucket.org/njhoffman/custom-resources.git
cp -v /home/vagrant/custom-resources/.* /home/vagrant
cp -rv /home/vagrant/custom-resources/bin /home/vagrant
cp -rv /home/vagrant/custom-resources/.vim /home/vagrant
cp -rv /home/vagrant/custom-resources/docker-config/ /home/vagrant/
chmod +x /home/vagrant/bin/*
chown -R vagrant /home/vagrant
chgrp -R vagrant /home/vagrant

# load bashrc_user from profile
echo -e '\nif [ -f "$HOME/.bashrc_user" ]; then \n\t. "$HOME/.bashrc_user" \n fi' >> /home/vagrant/.profile

# install nvm and npm
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
#echo -e '\nexport NVM_DIR="/home/vagrant/.nvm"' >> /home/vagrant/.bashrc_user
#echo -e '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> /home/vagrant/.bashrc_user # loads nvm
#nvm install v6.0
#nvm use v6.0
#apt-get install -y npm

# useful node packages
npm update
npm install vtop

# filebot
apt-get install -t -y jessie-backports openjdk-8-jre-headless ca-certificates-java openjdk-8-jre openjdk-8-jdk
cd /tmp
wget -O filebot.deb 'https://app.filebot.net/download.php?type=deb&arch=amd64'
dpkg -i filebot.deb


# update locate db /var/lib/mlocate/mlocate.db
updatedb

# glances system monitoring
curl -L https://bit.ly/glances | /bin/bash

# rethinkdb
echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
apt-get install apt-transport-https
apt-get update
apt-get install rethinkdb

# docker should be provisioned in vagrantfile directly
#elk-docker.readthedocs.io
# docker pull sebp/elk
# sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 -it --name elk sebp/elk
# docker pull nginx
# docker run --name some-nginx -p 8080:80 -v /some/content:/usr/share/nginx/html:ro -d nginx

#curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose

# install rsa key for easy access to git repos
# mkdir -p /home/vagrant/.ssh
# cp /home/vagrant/custom-resources/bitbucket-rsa/id_rsa /home/vagrant/.ssh/id_rsa
# chmod 0600 /home/vagrant/.ssh/id_rsa
# touch /home/vagrant/.ssh/known_hosts
# ssh-keyscan bitbucket.org >> /home/vagrant/.ssh/known_hosts

# tmux - compiling must be done by root
cd /usr/local/src
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make && make install

# elasticsearch/logstash
 curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.2/elasticsearch-2.3.2.tar.gz
 wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
 echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list


