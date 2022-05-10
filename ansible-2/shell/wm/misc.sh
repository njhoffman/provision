# misc

sudo apt-get install xfonts-terminus
sudo apt-get install clipit
sudo apt-get install fonts-font-awesome
# sudo apt-get install rofi # dmenu replacement
sudo apt-get install bison flex librsvg2-dev

cd ${HOME}/.local/src && git clone https://github.com/davatorium/rofi
cd rofi
git pull && git submodule update --init
autoreconf -i
./configure --prefix=${HOME}/.local
make V=1

# TODO: copy wallpaper to home directory

# sweet-theme-git (gtk3.2 theme)

# git clone https://github.com/EliverLara/Sweet
# https://www.gnome-look.org/p/1253385/
# mkdir -p ~/.themes
# cp -rv Sweet ~/.themes
# gsettings set org.gnome.desktop.interface gtk-theme "Sweet Mars"
# gsettings set org.gnome.desktop.wm.preferences theme "Sweet Mars"
#
# pip3 install pywal # changes theme to picture color
# sudo apt-get install conky-all
# wget https://www.gnome-look.org/p/1115225/startdownload?file_id=1465391037&file_name=139024-Conky-lua1.tar.gz&file_type=application/x-gzip&file_size=240680
#
# # fix inconsisted mouse cursors
# ls /usr/share/icons
# CURSOR=DMZ-Black
# gsettings set org.gnome.desktop.interfere cursor-theme "$CURSOR"
# sudo update-alternatives --set x-cursor-theme /usr/share/icons/$CURSOR/cursor.theme
#
# #jqmenu - x11 menu
# git clone https://github.com/johanmalm/jgmenu.git
# cd jgmenu
# ./scripts/install-debian-dependencies.sh  # or equivalent
# make
# make prefix=$HOME install
#
# # sudo apt-get install xorg-xinput
# # sudo apt-get install xorg-xbacklight
# # adobe-source-code-pro-fonts ttf-yosemite-san-francisco-font-git
