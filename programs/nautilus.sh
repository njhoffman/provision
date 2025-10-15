#!/usr/bin/env bash

function build {
  sudo apt install python3-gi python3-gi-cairo gir1.2-gtk-3.0
  pip3 install pycairo PyGObject

  cd Documents
  git clone https://github.com/GNOME/nautilus
  cd nautilus/src
  grep --recursive --ignore-case tabs *
  nano nautilus-window.c #This is where you need to do more work yourself
  cd ..
  ./configure
  make
  sudo checkinstall
}

function accels {
  sudo apt install python-nautilus
  mkdir -p ~/.local/share/nautilus-python/extensions
  vim ~/.local/share/nautilus-python/extensions/CtrlTab.py
  # #!/usr/bin/env python
  # # -*- coding: utf-8 -*-

  # import gi
  # gi.require_version('Nautilus', '3.0')
  # from gi.repository import GObject, Nautilus, Gtk

  # class CtrlTab(GObject.GObject, Nautilus.LocationWidgetProvider):
  #     def get_widget(self, uri, window):
  #         app = Gtk.Application.get_default()
  #         app.set_accels_for_action("win.tab-previous", ["<shift><control>Tab", "<control>Page_Up"])
  #         app.set_accels_for_action("win.tab-next", ["<control>Tab", "<control>Page_Down"])
}
