#!/bin/bash

ghq get -l https://github.com/altdesktop/playerctl

meson mesonbuild
sudo ninja -C mesonbuild install

# or

export PREFIX="/usr/local"
meson --prefix="$PREFIX" --libdir="${PREFIX}/lib" mesonbuild
export DESTDIR="$PWD/install"
ninja -C mesonbuild install

##

systemctl --user import-environment DISPLAY XAUTHORITY

if which dbus-update-activation-environment > /dev/null 2>&1; then
  dbus-update-activation-environment DISPLAY XAUTHORITY
fi
