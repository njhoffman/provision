# i3
sudo apt-get install i3 i3status dmenu i3lock xbacklight feh rxvt-unicode
sudo update-alternatives --set x-terminal-emulator "$(which urxvt)"
bindsym $mod+Return exec urxvt

# either one in ~/.i3/config
feh –bg-scale –zoom fill /home/username/path/to/wallpaper.jpg
exec --no-startup-id nitrogen --restore

gtf 1920 1080 59.9

xrandr –newmode “1920×1080” 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
xrandr –addmode Virtual1 1920×1080
xrandr –output Virtual1 –mode 1920×1080

xrandr --output Virtual1 --mode 1920x1080
# xrandr --newmode "1440x900_59.90"  106.29  1440 1520 1672 1904  900 901 904 932  -HSync +Vsync

sudo apt-get install compton compton-config




# Win-Enter : Open new terminal
# Win-D : Run programg
# Win-S : Full scale tile
