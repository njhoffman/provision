#!/bin/bash

# logstash 6.x installation
java -version
apt-get update && apt-get install logstash
systemctl enable logstash.service
systemctl start logstash.service

# logstash configuration
cd /etc/logstash
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
tar xzf GeoLite2-City.tar.gz
cp GeoLite2-City_*/GeoLite2-City.mmdb .
cp -rv $DIR/config/logstash/patterns /etc/logstash
cp $DIR/config/logstash/conf.d/logstash.conf /etc/logstash/conf.d
sed -i 's|# path.config:|path.config: /etc/logstash/conf.d/*.conf\n# path.config:|g' logstash.yml
# config.reload.automatic: false
# config.debug: false

