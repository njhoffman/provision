#!/bin/bash

# elasticsearch ionstallation
# cd /usr/local/src && curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.4.3.tar.gz
# tar -xvf elasticsearch-6.4.3.tar.gz && cd elasticsearch-6.4.3/bin && ./elasticsearch
apt-get update
apt-get install -y elasticsearch

# elastic search configuration
cd /etc/elasticsearch
sed -i 's|#network.host: 192.168.0.1|network.host: 127.0.0.1\n#network.host: 192.168.0.1|g' elasticsearch.yml
sed -i 's|#http.port: 9200|http.port: 9200\n#http.port: 9200|g' elasticsearch.yml

