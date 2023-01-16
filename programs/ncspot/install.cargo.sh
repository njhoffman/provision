#!/bin/bash

# Apart from MPRIS, ncspot will also create a domain socket on UNIX platforms (Linux, macOS, *BSD) at ~/.cache/ncspot/ncspot.sock. Applications or scripts can connect to this socket to send commands or be notified of the currently playing track, i.e. with netcat:
#
# % nc -U ~/.cache/ncspot/ncspot.sock
# play
# {"mode":{"Playing":{"secs_since_epoch":1672249086,"nanos_since_epoch":547517730}},"playable":{"type":"Track","id":"2wcrQZ7ZJolYEfIaPP9yL4","uri":"spotify:track:2wcrQZ7ZJolYEfIaPP9yL4","title":"Hit Me Where It Hurts","track_number":4,"disc_number":1,"duration":184132,"artists":["Caroline Polachek"],"artist_ids":["4Ge8xMJNwt6EEXOzVXju9a"],"album":"Pang","album_id":"4ClyeVlAKJJViIyfVW0yQD","album_artists":["Caroline Polachek"],"cover_url":"https://i.scdn.co/image/ab67616d0000b2737d983e7bf67c2806218c2759","url":"https://open.spotify.com/track/2wcrQZ7ZJolYEfIaPP9yL4","added_at":"2022-12-19T22:41:05Z","list_index":0}}
# playpause
# {"mode":{"Paused":{"secs":25,"nanos":575000000}},"playable":{"type":"Track","id":"2wcrQZ7ZJolYEfIaPP9yL4","uri":"spotify:track:2wcrQZ7ZJolYEfIaPP9yL4","title":"Hit Me Where It Hurts","track_number":4,"disc_number":1,"duration":184132,"artists":["Caroline Polachek"],"artist_ids":["4Ge8xMJNwt6EEXOzVXju9a"],"album":"Pang","album_id":"4ClyeVlAKJJViIyfVW0yQD","album_artists":["Caroline Polachek"],"cover_url":"https://i.scdn.co/image/ab67616d0000b2737d983e7bf67c2806218c2759","url":"https://open.spotify.com/track/2wcrQZ7ZJolYEfIaPP9yL4","added_at":"2022-12-19T22:41:05Z","list_index":0}}
# Each time the playback status changes (i.e. after sending the play/playpause command or simply by playing the queue), the current status will be published as a JSON structure.
#
# Possible use cases for this could be:
#
# Controlling a detached ncspot session (in tmux for example)
# Displaying the currently playing track in your favorite application/status bar
# Setting up routines, i.e. to play specific songs/playlists when ncspot starts

cargo install ncspot
