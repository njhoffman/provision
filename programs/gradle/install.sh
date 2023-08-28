#!/bin/bash

# alternative to sdk install gradle 8.3
cd ~/Downloads
wget 'https://gradle.org/next-steps/?version=8.3&format=all'
mkdir /opt/gradle
unzip -d /opt/gradle gradle-8.3-all.zip
ln -s /opt/gradle/gradle-8.3/bin/gradle ~/.local/bin/gradle
alias gradlew="gradle wrapper"
gradle -v
