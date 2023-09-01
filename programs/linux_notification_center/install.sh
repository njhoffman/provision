#!/usr/bin/env bash
version=2.1.1

pip3 install notify-send.py

curl -sSL https://get.haskellstack.org/ | sh
ghq get -l phuhl/linux_notification_center
# make
# sudo make install

tar -xvzf linux_notification_center-"$version".tar.gz
cd linux_notification_center-"$version"
wget https://github.com/phuhl/linux_notification_center/releases/download/"$version"/deadd-notification-center
mkdir -p .out
mv deadd-notification-center .out
sudo make install

notify-send.py "Icons are" "COOL" \
  --hint string:image-path:face-cool
notify-send.py "And buttons" "Do you like buttons?" \
  --hint boolean:action-icons:true \
  --action yes:face-cool no:face-sick

notify-send.py "This notification has a progressbar" "33%" \
  --hint int:has-percentage:33

BRIGHTNESS=$(xbacklight -get)
NOTI_ID=$(notify-send.py "Bildschirmhelligkeit" "$BRIGHTNESS/100" \
  --hint string:image-path:video-display boolean:transient:true \
  int:has-percentage:"$BRIGHTNESS" \
  --replaces-process "brightness-popup")
