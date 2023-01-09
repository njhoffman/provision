#!/bin/bash

sudo apt install meson g++ \
  libfmt-dev \
  libpcre2-dev \
  libmad0-dev libmpg123-dev libid3tag0-dev \
  libflac-dev libvorbis-dev libopus-dev libogg-dev \
  libadplug-dev libaudiofile-dev libsndfile1-dev libfaad-dev \
  libfluidsynth-dev libgme-dev libmikmod-dev libmodplug-dev \
  libmpcdec-dev libwavpack-dev libwildmidi-dev \
  libsidplay2-dev libsidutils-dev libresid-builder-dev \
  libavcodec-dev libavformat-dev \
  libmp3lame-dev libtwolame-dev libshine-dev \
  libsamplerate0-dev libsoxr-dev \
  libbz2-dev libcdio-paranoia-dev libiso9660-dev libmms-dev \
  libzzip-dev \
  libcurl4-gnutls-dev libyajl-dev libexpat-dev \
  libasound2-dev libao-dev libjack-jackd2-dev libopenal-dev \
  libpulse-dev libshout3-dev \
  libsndio-dev \
  libmpdclient-dev \
  libnfs-dev \
  libupnp-dev \
  libavahi-client-dev \
  libsqlite3-dev \
  libsystemd-dev \
  libgtest-dev \
  libboost-dev \
  libicu-dev \
  libchromaprint-dev \
  libgcrypt20-dev

pip3 install sphinx_rtd_theme

ghq get -l MusicPlayerDaemon/mpd

meson . output/release --buildtype=debugoptimized -Db_ndebug=true -Dsysconfdir=/etc
meson configure output/release
ninja -C output/release
sudo ninja -C output/release install

sudo rm /etc/mpd.conf && sudo ln -s ~/.config/mpd/mpd.conf /etc/mpd.conf
mkdir ~/.mpd/playlists && touch ~/.mpd/tag_cache

echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1" >> /etc/pulse/default.pa

sudo systemctl enable mpd
sudo systemctl start mpd
