#!/bin/bash

# https://developer.android.com/studio#downloads
base="https://redirector.gvt1.com/edgedl/android/studio/ide-zips"
version="2022.3.1.18"
file="android-studio-$version-linux.tar.gz"

sudo apt install \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  lib32z1 \
  libbz2-1.0:i386

cd ~/Downloads || return
wget "$base/$version/$file"
tar xvf "$file"
sudo cp -r android-studio /opt

# cd /opt/android-studio/ && ./studio.sh

## Android Studio configuration environment variables ##
# STUDIO_VM_OPTIONS	Sets the location of the studio.vmoptions file. This file contains settings that affect the performance characteristics of the Java HotSpot Virtual Machine. This file can also be accessed from within Android Studio. See Customize your VM options.
# STUDIO_PROPERTIES	Sets the location of the idea.properties file. This file lets you customize Android Studio IDE properties, such as the path to user installed plugins and the maximum file size supported by the IDE. See Customize your IDE properties.
# STUDIO_JDK	Sets the location of the JDK that Android Studio runs in. When you launch the IDE, it checks the STUDIO_JDK, JDK_HOME, and JAVA_HOME environment variables, in that order.
# STUDIO_GRADLE_JDK	Sets the location of the JDK that Android Studio uses to start the Gradle daemon. When you launch the IDE, it first checks STUDIO_GRADLE_JDK. If STUDIO_GRADLE_JDK is not defined, the IDE uses the value set in the project structure settings.
