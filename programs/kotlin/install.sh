#!/bin/bash

# alternative to using sdkman
cd ~/Downloads
tar xzvf kotlin-native-linux-x86_64-1.9.0.tar.gz
cd kotlinc/bin
cp -rv * ~/.local/bin
