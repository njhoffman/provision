#!/bin/bash

pip3 install pirate-get
pirate-get "Adventure Time"
# m43 m50 t35

# local database
# https://github.com/darksun-misc/piratebay-db-dump

# ~/.config/pirate-get
# [Save]
# ; directory where to save files
# directory = $PWD

# ; save each selected magnet link in a .magnet file
# magnets = false

# ; save each selected torrent in a .torrent file
# torrents = false

# [LocalDB]
# ; use a local copy of the csv formatted pirate bay database
# enabled = false

# ; path of the database
# path = ~/downloads/pirate-get/db

# [Search]
# ; maximum number of results to show
# total-results = 50

# [Misc]
# ; specify a custom command for opening the magnet
# ; ex. myprogram --open %s
# ; %s represent the magnet uri
# openCommand =

# ; open magnets with transmission-remote client
# transmission = false
# ; set to username:password if needed
# transmission-auth =
# ; set to the port number if needed
# transmission-port =

# ; use colored output
# colors = true

# ; the pirate bay mirror(s) to use:
# ; one or more space separated URLs
# mirror = http://thepiratebay.org
