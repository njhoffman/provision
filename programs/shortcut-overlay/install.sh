#!/bin/bash
sudo apt install \
  gettext \
  gnome-settings-daemon-dev \
  gsettings-desktop-schemas-dev \
  libcanberra-dev \
  libcanberra-gtk3-dev \
  libclutter-1.0-dev \
  libgala-dev \
  libgee-0.8-dev \
  libgexiv2-dev \
  libglib2.0-dev \
  libgnome-desktop-3-dev \
  libgranite-dev \
  libgtk-3-dev \
  libgtk-4-dev \
  libmutter-10-dev \
  libmutter-2-dev \
  libxml2-utils \
  meson \
  valac

ghq get -l elementary/gala

meson build --prefix=/usr
cd build
ninja

meson configure -Ddocumentation=true
# To install, use ninja install, then execute with gala --replace

sudo ninja install
gala --replace

ghq get -l elementary/gala

ghq get -l https://github.com/elementary/shortcut-overlay

meson build --prefix=/usr
cd build
ninja

sudo ninja install
io.ementary.shortcut-overlay
io.ementary.app-center
