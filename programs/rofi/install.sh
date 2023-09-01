#!/bin/bash

# ### For building
# -   C compiler that supports the c99 standard. (gcc or clang)
# -   make
# -   autoconf
# -   automake (1.11.3 or up)
# -   pkg-config
# -   flex 2.5.39 or higher
# -   bison
# -   check (Can be disabled using the `--disable-check` configure flag)
#     check is used for build-time tests and does not affect functionality.
# -   Developer packages of the external libraries
# -   glib-compile-resources
# ### External libraries
# -   libpango >= 1.50
# -   libpangocairo
# -   libcairo
# -   libcairo-xcb
# -   libglib2.0 >= 2.68
#     - gmodule-2.0
#     - gio-unix-2.0
# -   libgdk-pixbuf-2.0
# -   libstartup-notification-1.0
# -   libxkbcommon >= 0.4.1
# -   libxkbcommon-x11
# -   libxcb (sometimes split, you need libxcb, libxcb-xkb and libxcb-randr
#     libxcb-xinerama)
# -   xcb-util
# -   xcb-util-wm (sometimes split as libxcb-ewmh and libxcb-icccm)
# -   xcb-util-cursor
# -   xcb-imdkit  (optional, 1.0.3 or up preferred)
sudo apt install \
  libpango1.0-dev \
  libgdk-pixbuf2.0-dev \ 
  libxkbcommon-x11-dev \
  libxcb-xinerama0-dev  \
  bstartup-notification0-dev \
  flex \
  go-md2man \
  cppcheck \
  ohcount

cd ~/.local/src
git clone git@github.com:davatorium/rofi
../configure --prefix="$HOME"/.local/
# Meson
meson setup build --prefix "$HOME"/.local
meson install
