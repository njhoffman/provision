#termite

apt-get install gtk-doc-tools intltool gnutls-dev libgtk-3-dev gperf

# Get and install vte-ng
mkdir -p $HOME/.local/src
cd $HOME/.local/src
git clone https://github.com/thestinger/vte-ng.git
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh --disable-introspection --disable-vala
make && make install
cd ..
# Get and install termite, and setup

git clone --recursive https://github.com/thestinger/termite.git
cd termite && make && sudo make install
ldconfig
mkdir -p /lib/terminfo/x
ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite

git clone https://github.com/khamer/base16-termite.git  ~/.config/termite/base16-themes
cp ~/.config/termite/base16-themes/themes/base16-default-dark.config ~/.config/termite/config
