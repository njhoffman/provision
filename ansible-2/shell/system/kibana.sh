#!/bin/bash

# kibana installation
apt-get update 
apt-get install -y kibana
systemctl daemon-reload && systemctl enable kibana.service && systemctl start kibana.service

# kibana confriguration
cd /etc/kibana
sed -i 's|#server.host: "localhost"|server.host: 0.0.0.0\n#server.host: "localhost"|g' kibana.yml
sed -i 's|#server.port: 5601|server.port: 5601\n#server.port: 5601|g' kibana.yml
sed -i 's|#elasticsearch.url: "http://localhost:9200"|elasticsearch.url: "http://localhost:9200\n#elasticsearch.url: "http://localhost:9200"|g' kibana.yml

