#!/bin/bash

ghq get -l ranger/ranger
pip3 install -r requirements.txt
make
sudo make install

# git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
git clone https://github.com/cdump/ranger-devicons2 ~/.config/ranger/plugins/devicons2

# ~/.config/ranger/plugins/plugin_fasd_log.py
# import ranger.api
# try: from shlex import quote
# except ImportError: from pipes import quote

# old_hook_init = ranger.api.hook_init

# def hook_init(fm):
#     def fasd_add():
#         fm.execute_console("shell fasd --add " + quote(fm.thisfile.path))
#     fm.signal_bind('execute.before', fasd_add)
#     return old_hook_init(fm)

# ranger.api.hook_init = hook_init
