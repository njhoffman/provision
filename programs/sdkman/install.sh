#!/bin/bash

curl -s "https://get.sdkman.io" | bash
# export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash
# curl -s "https://get.sdkman.io?rcupdate=false" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk install kotlin
