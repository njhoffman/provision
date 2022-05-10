#!/bin/bash
DIR=${pwd}

function msgHeader {
  clr_green='\033[38;5;72m'
  nc='\033[0m'
  echo "\n-- $clr_green $1 $nc"
}

function msg {
  clr_bold='\033[1;37m'
  nc='\033[0m'
  echo "\n-- $clr_bold $1 $nc"
}

msgHeader "Initializing vagrant user and installing core packages"
source "./provision/init.sh"

msg "Installing Vim"
source "./provision/vim.sh"

msg "Installing Development Utilities"
source "./provision/dev.sh"

msg "Installing Java OpenJDK"
source "./provision/java.sh"

msg "Installing RethinkDB"
source "./provision/rethinkdb.sh"

msg "Installing InfluxDB"
source "./provision/influxdb.sh"

msg "Installing Grafana"
source "./provision/grafana.sh"

# ------------------------------------------------------------
# ELK Logging configuration: elasticsearch -> kibana
#  -- needs at least 4gb memory, java 1.8
# ------------------------------------------------------------

msgHeader "Installing and configuring ELK stack"
# add ELK stack to apt repository
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

msg "Installing elasticsearch 6.x"
./provision/elasticsearch.sh

msg "Installing kibana 6.x"
./provision/kibana.sh

msg "Installing logstash 6.x"
./provision/logstash.sh

# install and configure collectd
# ./provision/collectd.sh

# ------------------------------------------------------------
# Miscellaneous packages  and configuration
# ------------------------------------------------------------

msgHeader "Installing Miscellaneous Packages"

msg "Installing glances"
curl -L https://bit.ly/glances | /bin/bash
apt-get install glances

msg "Installing vim pager"
cd /usr/local/src
git clone https://github.com/rkitover/vimpager
cd vimpager
make install-deb

updatedb

msgHeader "Finished, make sure you update hostname, timezone, and sudo timeout"
msg "Increase sudo timeout: sudo visudo => Defaults: env_reset, timestamp_timeout=1440"
msg "hostname -b MY_HOST_NAME; /etc/hostname; /etc/host; hostnamectl set-hostname MY_HOST_NAME"

# port listeners
# 80    nginx
# 3000  grafana
# 8086  influxdb
# 8088  influxdb local
# 8125  collectd statsd port
# 25826 influxd collectd plugin binding port
