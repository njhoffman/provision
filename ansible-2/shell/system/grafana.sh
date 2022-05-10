#!/bin/bash
# install grafana

# cd /usr/local/src
# wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.3.2_amd64.deb
# dpkg -i grafana_5.3.2_amd64.deb
# sudo /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --homepath=/usr/share/grafana
echo "deb https://packagecloud.io/grafana/stable/debian/ stretch main" | tee -a /etc/apt/sources.list
curl https://packagecloud.io/gpg.key | apt-key add -
apt-get update  
apt-get install -y grafana
/bin/systemctl daemon-reload
/bin/systemctl enable grafana-server
/bin/systemctl start grafana-server

