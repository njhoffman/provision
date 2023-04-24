#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
sudo chmod a+wr /usr/share/spotify
sudo chmod -R a+wr /usr/share/spotify/Apps
sudo spicetify backup apply
sudo spicetify restore backup
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
spicetify config custom_apps marketplace
spicetify apply

# git clone --depth=1 https://github.com/spicetify/spicetify-themes.git && cd spicetify-themes
# cp -r * ~/.config/spicetify/Themes
# # Sleek/deeper.png  Matte Sleek/deep
# spicetify config current_theme Dreary
# spicetify config color_scheme deeper
# sudo spicetify apply
