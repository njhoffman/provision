cd /usr/local/src
wget http://www.musicpd.org/download/mpd/0.21/mpd-0.21.24.tar.xz
tar xf mpd-0.21.24.tar.xz
cd mpd-0.21.24
meson . output/release --buildtype=debugoptimized -Db_ndebug=true -Dsysconfdir=/etc
meson configure output/release
ninja -C output/release
ninja -C output/release install
systemctl enable mpd
systemctl start mpd

add-apt-repository ppa:linuxuprising/apps
apt update
apt install glava

# wget http://www.musicpd.org/download/mpc/0/mpc-0.33.tar.xz
sudo apt install g++ \
  pavucontrol \
  libpcre3-dev \
  libmad0-dev libmpg123-dev libid3tag0-dev \
  libflac-dev libvorbis-dev libopus-dev \
  libadplug-dev libaudiofile-dev libsndfile1-dev libfaad-dev \
  libfluidsynth-dev libgme-dev libmodplug-dev \
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
  libnfs-dev libsmbclient-dev \
  libupnp-dev \
  libavahi-client-dev \
  libsqlite3-dev \
  libsystemd-dev \
  libgtest-dev \
  libboost-dev \
  libicu-dev

# apt-get purge \
#   cairo-dock-impulse-plug-in \
#   gstreamer1.0-pulseaudio \
#   libcanberra-pulse \
#   libpulse-dev \
#   libpulse-java \
#   libpulse-jni \
#   libpulse-mainloop-glib0 \
#   libpulse-ocaml \
#   libpulse-ocaml-dev \
#   libpulse0 \
#   libpulsedsp \
#   libsox-fmt-pulse \
#   liquidsoap-plugin-pulseaudio \
#   mkchromecast-pulseaudio \
#   osspd-pulseaudio \
#   projectm-pulseaudio \
#   pulseaudio \
#   pulseaudio-dlna \
#   pulseaudio-equalizer \
#   pulseaudio-esound-compat \
#   pulseaudio-module-bluetooth \
#   pulseaudio-module-gconf \
#   pulseaudio-module-jack \
#   pulseaudio-module-lirc \
#   pulseaudio-module-raop \
#   pulseaudio-module-zeroconf \
#   pulseaudio-utils \
#   pulsemixer \
#   pulseview \
#   snd-gtk-pulse \
#   xfce4-pulseaudio-plugin \
#   xmms2-plugin-pulse \
#   xrdp-pulseaudio-installer
