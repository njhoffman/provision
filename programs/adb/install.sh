#!/usr/bin/env bash
# sudo apt install adb
mkdir cli-tools
wget -c https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip
cd platform-tools/ && sudo install adb /usr/local/bin

adb start-server

# connect usb to device or over network if wireless debugging enabled
adb pair IP_Address:Port
adb connect $IP_ADDRESS

adb devices -l

# installing apps
adb install ~/MusiX.apk
adb install -t /path/to/testapp.apk

# Set up port forwarding:
adb forward tcp:6100 tcp:7100

# Copy a file/directory from the device:
adb pull <path_to_the_remote_object> <path_to_the_local_destination>

# Copy a file/directory to the device:
adb push <path_to_the_local_object> <path_to_the_remote_destination>

# Initiate an ADB shell:
adb shell

# control screensaver
settings put secure screensaver_components com.neilturner.aerialviews/.ui.screensaver.DreamActivity
settings get secure screensaver_components
# should return com.neilturner.aerialviews...
# set screensaver timeout in ms
settings put system screen_off_timeout 600000

adb kill-server
