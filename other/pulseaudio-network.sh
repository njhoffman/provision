#!/bin/bash

##### client computer ######
sudo apt install pulseaudio-module-zeroconf avahi-utils avahi-daemon
#: /etc/pulse/default.pa.d/tcp.pa
echo 'load-module module-zeroconf-discover'

##### host computer ######
sudo apt install pulseaudio-module-zeroconf avahi-utils avahi-daemon
#: /etc/pulse/default.pa.d/tcp.pa
# for not anonymous, cp ~/.config/pulse/cookie to all clients
echo 'load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1;192.168.0.0/24 auth-anonymous=1'
echo 'load-module module-zeroconf-publish'
pacmd list-modules | grep module-native-protocol-tcp

## starting pulse as a systemwide service ##
# Add user pulse. PulseAudio daemon switches to this user after starting.
useradd -d /var/run/pulse -s /usr/bin/nologin -G audio pulse
# Optionally add user pulse to the bluetooth group, if you have it (bluez) and want PulseAudio to use bluetooth.
usermod -aG bluetooth pulse
# Add group pulse-access. This group is used by PulseAudio server for access control.
groupadd pulse-access
# Add users to pulse-access group, if you want them to have access to the system-wide PulseAudio instance.
usermod -aG pulse-access root
useradd -d /var/run/pulse -s /usr/bin/nologin -G audio pulse

# Create /etc/systemd/system/pulseaudio.service
cat << EOF
[Unit]
Description=Sound Service

[Service]
# Note that notify will only work if --daemonize=no
Type=notify
ExecStart=/usr/bin/pulseaudio --daemonize=no --exit-idle-time=-1 --disallow-exit=true --system --disallow-module-loading
Restart=always

[Install]
WantedBy=default.target
EOF

# Then enable pulseaudio.service at the system level. You will also need to disable the user-level PulseAudio service across the whole system:
systemctl --global mask pulseaudio.socket
