# polybar

apt-get install -y \
  alsa-tools \
  cmake \
  cmake-data \
  libasound2-dev \
  libcairo2-dev \
  libcurl4-openssl-dev \
  libiw-dev \
  libmpdclient-dev \
  libpulse-dev \
  libxcb-composite0-dev \
  i3-wm \
  libasound2-dev \
  libcurl4-openssl-dev \
  libjsoncpp-dev \
  libmpdclient-dev \
  libnl-genl-3-dev \
  libpulse-dev \
  libxcb-cursor-dev \
  libxcb-xkb-dev \
  libxcb-xrm-dev \
  libxcb-ewmh-dev \
  libxcb-ewmh2 \
  libxcb-icccm4-dev \
  libxcb-image0-dev \
  libxcb-randr0-dev \
  libxcb-util0-dev \
  libxcb-xkb-dev \
  libxcb-xrm-dev \
  libxcb1-dev \
  pkg-config \
  python-xcbgen \
  xcb \
  xcb-proto

cd /usr/local/src
git clone https://github.com/jaagr/polybar.git
cd polybar
./build.sh
