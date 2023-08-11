#!/bin/bash

# switch terminal font to DejaVuSansMono Nerd Font, grey on black
# switch appearance (gsettings) to dark mode
sudo apt install qt5ct qt5-style-plugins qt5-style-kvantum gnome-tweaks gnome-shell-extensions # lxappearance
echo -e "export QT_QPA_PLATFORMTHEME=qt5ct\nexport QT_STYLE_OVERRIDE=kvantum" | sudo tee -a /etc/environment
# kvantum manager -> kvadaptadark, kvarcdark, kvgnomedark, kvflat, kvcyan

# gsettings set org.gnome.desktop.interface cursor-blink-time 500
# gsettings set org.gnome.desktop.interface cursor-blink-timeout 20
# gsettings set org.gnome.desktop.interface gtk-theme "Juno-ocean"
# gsettings set org.gnome.desktop.wm.preferences theme "Juno-ocean"
# gsettings set org.gnome.shell.extensions.user-theme name "Juno-ocean"

# sudo chmod -R 755 /usr/share/themes/Zukitwo

# Themes work in Gnome 40, 41, 42 and 43 versions, but since Gnome 42 introduced Libadwaita the themes files for GTK4 applications must be placed in a new directory in a new path: '~/.config/gtk-4.0' with the name 'gtk.css'; this will apply the themes automatically without use Gnome Tweaks but, for GTK3 applications, we must always use Tweaks as we have done so far.
# To install the themes you will need to download the theme package of your choice and place it in the following path: ~/.themes; for themes in Gnome 43 there is no longer a separate stylesheet, you can create a symlink for the files inside the gtk-4.0 folder which is inside the theme package, or just copy the files inside the gtk-4.0 folder into the ~/.conifg/gtk-4.0 path.
# As I mentioned before, the GTK4 themes don't need to be applied with Tweaks, they are applied automatically but, if you have applications open you will have to close and open them for the theme to be applied, but for GTK3 applications you do need to apply them with Tweaks, as usual.
# Icons: Suru++, Shell: Tokyonight-Storm-BL, Legacy: Juno-ocean
# ~/bin/inotify-stats

# /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf set: wifi.powersave = 2
# sudo sed -i 's/3/2/' /etc/NetworkManager/conf.d/*
# add fsnotify and net6 disabling to sysctl.conf
