#!/bin/bash
# collectd installation

# wget https://collectd.org/files/collectd-5.8.1.tar.bz2
# tar -jxf collectd-5.8.1.tar.bz2
# cd collectd-5.8.1
# ./configure
# make all install
# cd /etc/systemd/system/
# wget https://raw.githubusercontent.com/martin-magakian/collectd-script/master/collectd.service
# chmod +x collectd.service
# systemctl start collectd.service
# systemctl status collectd.service

# collectd configuration
# cd /opt/collectd/etc
# sed -i "s/#Hostname    \"localhost\"/Hostname \"$HOST\"/" collectd.conf
# sed -i "s/#AutoLoadPlugin false/AutoLoadPlugin true" collectd.conf
# sed -i "s/#LoadPlugin syslog/LoadPlugin syslog" collectd.conf
# sed -i "s/#LoadPlugin aggregation/LoadPlugin aggregation" collectd.conf
# sed -i "s/#LoadPlugin cpufreq/LoadPlugin cpufreq" collectd.conf
# sed -i "s/#LoadPlugin disk/LoadPlugin disk" collectd.conf
# sed -i "s/#LoadPlugin processes/LoadPlugin processes" collectd.conf
# sed -i "s/#LoadPlugin statsd/LoadPlugin statsd" collectd.conf
# sed -i "s/#LoadPlugin uptime/LoadPlugin uptime" collectd.conf
# sed -i 's|#<Plugin aggregation>|<Aggregation>\n Plugin "cpu" \n Type "cpu" \n GroupBy "Host" \n GroupBy "TypeInstance" \n</Aggregation> \n\n#<Plugin aggregation>|g' collectd.conf
# sed -i 's|#<Plugin cpu>|<Plugin cpu>\n  ReportByCpu false\n  ReportByState true\n  ValuesPercentage true \n</Plugin> \n\n#<Plugin cpu>|g' collectd.conf
# sed -i 's|#<Plugin interface>|<Plugin interface>\n  Interface "eth0"\n  Interface "lo"\n</Plugin> \n\n#<Plugin interface>|g' collectd.conf
# sed -i 's|#<Plugin load>|<Plugin load>\n  ReportRelative true\n</Plugin> \n\n#<Plugin load>|g' collectd.conf
# sed -i 's|#<Plugin memory>|<Plugin memory>\n  ValuesAbsolute true\n  ValuesPercentage true\n</Plugin> \n\n#<Plugin memory>|g' collectd.conf
# sed -i 's|#<Plugin processes>|<Plugin processes>\n  Process "node"\n</Plugin> \n\n#<Plugin processes>|g' collectd.conf
# sed -i 's|#<Plugin statsd>|<Plugin statsd>\n  Host "::"\n  Port "8125" \n</Plugin> \n\n#<Plugin statsd>|g' collectd.conf
# sed -i 's|#<Plugin swap>|<Plugin swap>\n  ReportByDevice false\n  ReportBytes true \n</Plugin> \n\n#<Plugin swap>|g' collectd.conf
# sed -i 's|#<Plugin write_http>|#<Plugin write_http>\n#  <Node "andromeda">\n#    URL "http://45.56.121.208:8077"\n#    Format "JSON"\n#  </Node>\n#</Plugin>\n\n#<Plugin write_http>|g' collectd.conf

