#!/bin/bash

# https://github.com/theNizo/linux_rocksmith

trap "exit" INT
exit_msg() {
  echo "Exiting..."
  exit 1
}

if [ -f "$(which apt)" ]; then
  dist=deb
  x32dll=/usr/lib/i386-linux-gnu/wine/wineasio.dll
  x32so=/usr/lib/i386-linux-gnu/wine/wineasio.dll.so
  x64dll=/usr/lib/x86_64-linux-gnu/wine/wineasio.dll
  x64so=/usr/lib/x86_64-linux-gnu/wine/wineasio.dll.so
else
  echo "Your distro does not seem to be compatible."
  exit_msg
fi

echo
echo "============================================"
echo "Set Rocksmith launcher to most recent Proton version"
echo "============================================"
echo

# determine the game's install location
# checks first, if the game is in the default Steam Library
if [ -f "$HOME/.steam/steam/steamapps/common/Rocksmith2014/Rocksmith2014.exe" ]; then
  echo "Game installation found in the default Steam Library. Using this."
  echo
  game="$HOME/.steam/steam/steamapps/common/Rocksmith2014"
else
  echo "Please specify the root folder of the game's"
  echo "installation. Should contain 'Rocksmith.exe'"
  read -p "Rocksmith install path: " game
  while [ ! -f "$game/Rocksmith2014.exe" ]; do
    echo
    echo "Invalid Path, please try again."
    read -p "Rocksmith install path: " game
  done
fi

prefix="$game/../../compatdata/221680/pfx"
runner="$HOME/.steam/debian-installation/steamapps/common/Proton 7.0"

if [ -d "$runner" ]; then
  echo "Please specify the root of your Proton installation"
  echo
  # read this
  read -p "Proton: " runner

  while ! [ -f "$runner/dist/bin/wine" -o -f "$runner/files/bin/wine" -o -f "$runner/bin/wine" ]; do
    echo
    echo "This doesn't seem to be a Proton installation path, please try again."
    read -p "Proton: " runner
  done
fi

# adjust path accordingly, if needed.
if [ -f "$runner/dist/bin/wine" ]; then
  runner="$runner/dist"
elif [ -f "$runner/files/bin/wine" ]; then
  runner="$runner/files"
elif ! [ -f "$runner/bin/wine" ]; then # dead code, unless I messed up while writing this script
  echo "There's something wrong with the path recognition."
  echo "Please open an issue on the repo."
  exit_msg
fi

# install needed stuff
case $dist in
  "deb")
    echo "We will need to add an apt repo, to install necessary software"
    ## ask, or check, if this already exists
    sudo apt-get install apt-transport-https gpgv
    wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
    sudo dpkg -i kxstudio-repos_10.0.3_all.deb
    sudo apt update
    sudo apt install cadence carla wine wineasio jackd2
    ;;
  *)
    # this should be dead code, but just in case
    echo "This isn't supposed to happen. Please open"
    echo "an issue and inform the dev that the script"
    echo "continued without a valid 'dist' value."
    ;;
esac

# add user to needed groups
sudo groupadd audio
sudo groupadd realtime
sudo usermod -aG audio $USER
sudo usermod -aG realtime $USER

# installs wineasio in proton
cp "$x32dll" "$runner/lib/wine/i386-windows/wineasio.dll"
cp "$x32so" "$runner/lib/wine/i386-unix/wineasio.dll.so"
cp "$x64dll" "$runner/lib64/wine/x86_64-windows/wineasio.dll"
cp "$x64so" "$runner/lib64/wine/x86_64-unix/wineasio.dll"

mv "$game/../../compatdata/221680" "$game/../../compatdata/221680.bak" # backs up an already existing prefix, makes place for a clean new one

# tell user to close game once you see the loading screen
echo
echo "================================"
echo "The game will now start."
echo "Close after it finishes loading"
echo "================================"
xdg-open steam://rungameid/221680 #run game

echo
read -p "Press enter to continue"

WINEPREFIX="$prefix" regsvr32 /usr/lib32/wine/i386-windows/wineasio.dll # register wineasio in prefix

# download RS_ASIO latest release, unpack to correct location, insert "WineASIO"
wget https://github.com/mdias/rs_asio/releases/download/v0.5.7/release-0.5.7.zip -O RS_ASIO.zip
unzip RS_ASIO.zip -d "$game"
rm "$game/RS_ASIO.ini"
wget https://raw.githubusercontent.com/theNizo/linux_rocksmith/main/RS_ASIO.ini -O "$game/RS_ASIO.ini"
rm RS_ASIO.zip
rm "$game/Rocksmith.ini"

# create launch script
touch "$HOME/rocksmith.sh"
echo "#!/bin/bash" > "$HOME/rocksmith.sh"
echo "cd \"$game\"" >> "$HOME/rocksmith.sh"
echo "WINEPREFIX=\"$prefix\" \"$runner/bin/wine\" \"$game/Rocksmith2014.exe\"" >> "$HOME/rocksmith.sh"
chmod u+x "$HOME/rocksmith.sh"

echo
echo "==============================================="
echo "Setting up cadence..."
echo "Configure->Driver->ALSA, hw:0, inputs:1, outputs: 2"
echo "Tweaks->WineASIO, tick all, inputs: 1, outputs: 2"
echo "==============================================="
echo

cadence

echo "==============================================="
echo "To run the game, start JACK, have Steam"
echo "opened, then run ~/rocksmith.sh"
echo
echo "Please log out and back in, so that your groups"
echo "and permissions are reloaded."
echo "==============================================="
echo

# catia
# ~/rocksmith.sh

exit 0
