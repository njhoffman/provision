#!/bin/bash
# main entry point, root privileges

# TODO: make path environment variable
dir_provision="/home/nicholas/resources/provision"
. $dir_provision/provision.opts.sh
. $dir_provision/provision.funcs.sh



msgHeader "($USER) Provisioning System Packages"
  . $dir_provision/system/init.sh

if [[ -z "$_PROV_DEV_TOOLS" || "$_PROV_DEV_TOOLS" == "1" ]]; then
  msgHeader "($USER) Installing development tools"
  . $dir_provision/system/dev.sh
fi

if [[ -z "$_PROV_SHELL" || "$_PROV_SHELL" == "1" ]]; then
  msgHeader "($USER) Installing shell packages"
  . $dir_provision/system/shell.sh
fi

if [[ -z "$_PROV_NETWORK_TOOLS" || "$_PROV_NETWORK_TOOLS" == "1" ]]; then
  msgHeader "($USER) Installing network tools"
  . $dir_provision/system/dev.sh
fi

if [[ -z "$_PROV_VIM" || "$_PROV_VIM" == "1" ]]; then
  msgHeader "($USER) Installing VIM"
  . $dir_provision/system/vim.sh
fi

if [[ -z "$_PROV_ELK_STACK" || "$_PROV_ELK_STACK" == "1" ]]; then
  msgHeader "($USER) Installing ELK stack"
  . $dir_provision/system/elasticsearch.sh
  . $dir_provision/system/logstash.sh
  . $dir_provision/system/kibana.sh
fi

if [[ -z "$_PROV_INFLUXDB_STACK" || "$_PROV_INFLUXDB_STACK" == "1" ]]; then
  msgHeader "($USER) Installing CollectD/InfluxDB/Grafana stack"
  . $dir_provision/system/collectd.sh
  . $dir_provision/system/grafana.sh
  . $dir_provision/system/influxdb.sh
fi

if [[ -z "$_PROV_RETHINKDB" || "$_PROV_RETHINKDB" == "1" ]]; then
  msgHeader "($USER) Installing RethinkDB"
  . $dir_provision/system/rethinkdb.sh
fi

# TODO: put this in root provision.sh
# user privilege installations
# msgHeader "($USER) Provisioning User Packages"
# sudo -u vagrant /vagrant/provision.user.sh
# su -l vagrant -c "/vagrant/provision.user.sh"

msgHeader "($USER) Final Configuration Steps"
updatedb

