#!/bin/bash

# influxdb installation
touch /etc/apt/sources.list.d/influxdb.list
echo "deb https://repos.influxdata.com/debian stretch stable" >> /etc/apt/sources.list.d/influxdb.list
systemctl start influxdb && systemctl enable influxdb && systemctl status influxdb

# influxdb configuration
cd /etc/influxdb
sed -i 's|[[collectd]]|[[collectd]]\n  enabled = true \n  bind-address = ":25826" \n  database = "collectd" \n  types db = "/opt/collectd/share/collectd/types.db"\n\n|g' influxdb.conf
sed -i 's|[http]|[http]\n  enabled = true\n  bind-address = ":8086"\n  auth-enabled = false\n  log-enabled true\n  pprof-enabled = true\n  https-enabled = false\n\n|g' influxdb.conf

# telegraf installation
curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
source /etc/os-release
test $VERSION_ID = "7" && echo "deb https://repos.influxdata.com/debian wheezy stable" | tee /etc/apt/sources.list.d/influxdb.list
test $VERSION_ID = "8" && echo "deb https://repos.influxdata.com/debian jessie stable" | tee /etc/apt/sources.list.d/influxdb.list
test $VERSION_ID = "9" && echo "deb https://repos.influxdata.com/debian stretch stable" |tee /etc/apt/sources.list.d/influxdb.list

# telegraf configuration
curl -G http://localhost:8086/query --data-urlencode "q=CREATE USER \"telegraf\" with PASSWORD 'telegraf' WITH ALL PRIVILEGES"
curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE telegraf"
curl -G http://localhost:8086/query?pretty=true --data-urlencode "db=telegraf" --data-urlencode "q=show series"
cd /etc/telegraf
sed -i 's|# database = "telegraf"|urls = ["http://localhost:8086"]\n  database = "telegraf"\n\n# database = "telegraf" |g' telegraf.conf
sed -i -r 's|# \[\[inputs.statsd\]\]|\[\[inputs.statsd\]\]\n  service_address = "8125"\n  percentiles = [90]\n  metric_separator = "_"\n\n|g' telegraf.conf

