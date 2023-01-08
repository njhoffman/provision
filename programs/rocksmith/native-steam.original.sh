#!/bin/bash
trap "exit" INT

# double-hashtag (## comment) means it is a TODO
# Note: Someone once had issues with the realtime setup on debian-based. I don't check for this here.

# because I like to write this.
exit_msg() {
	echo "Exiting..."
	exit 1
}

# determines the distro, based on the package manager. This way, I don't need a list of child-distros.
# sets a few distro-specific variables. I'm assuming they only differ by parent-distro.
if [ -f "$(which apt)" ]; then
	dist=deb
	x32dll=/usr/lib/i386-linux-gnu/wine/wineasio.dll
	x32so=/usr/lib/i386-linux-gnu/wine/wineasio.dll.so
	x64dll=/usr/lib/x86_64-linux-gnu/wine/wineasio.dll
	x64so=/usr/lib/x86_64-linux-gnu/wine/wineasio.dll.so
elif [ -f "$(which pacman)" ]; then
	dist=arch
	x32dll=/usr/lib32/wine/i386-windows/wineasio.dll
	x32so=/usr/lib32/wine/i386-unix/wineasio.dll.so
	x64dll=/usr/lib/wine/x86_64-windows/wineasio.dll
	x64so=/usr/lib/wine/x86_64-unix/wineasio.dll.so
else
	echo "Your distro does not seem to be compatible."
	exit_msg
fi

clear
echo "!! The provider of this script takes no responsibility  !!"
echo "!! and will not guarantee for this to work.             !!"
echo "!! This script is not compatible with pipewire.         !!"
echo "!!                                                      !!"
echo "!! The Script is experimental. I didn't really test it. !!"
echo
echo "============================================"
echo "WARNING! You should set the Proton version"
echo "you want to use with Rocksmith NOW in Steam!"
echo "============================================"
echo

# determine the game's install location
# checks first, if the game is in the default Steam Library
if [ -f $HOME/.steam/steam/steamapps/common/Rocksmith2014/Rocksmith2014.exe ]; then
	echo "Game installation found in the default Steam Library. Using this."
	echo
	game=$HOME/.steam/steam/steamapps/common/Rocksmith2014
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

prefix="$game/../../compatdata/221680"

echo "Please specify the root of your Proton installation"
echo "that you want to use. It needs to be Proton,"
echo "otherwise the game can't find Steam"
echo
# read this
read -p "Proton: " runner
while ! [ -f "$runner/dist/bin/wine" -o -f "$runner/files/bin/wine" -o -f "$runner/bin/wine" ]; do
	echo
	echo "This doesn't seem to be a Proton installation path, please try again."
	read -p "Proton: " runner
done

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
# (assumes you have and use sudo)
case $dist in
	"deb")
		echo "We will need to add an apt repo, to install necessary software"
		## ask, or check, if this already exists
		sudo apt-get install apt-transport-https gpgv
		wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
		sudo dpkg -i kxstudio-repos_10.0.3_all.deb
		sudo apt update
		sudo apt install cadence carla wineasio jackd2
		;;
	"arch")
		echo "If you're asked to replace JACK, do so."
		sleep 1
		# We can't use noconfirm here, because you might have to replace jack
		if [ -f $(which yay) ]; then
			yay -S carla jack2 lib32-jack2 realtime-privileges wineasio
		elif [ -f $(which paru) ]; then # literally the same text, but in case other AUR helpers have a different syntax
			paru -S carla jack2 lib32-jack2 realtime-privileges wineasio
		else
			echo "This script currently only supports yay or paru, but could"
			echo "not detect either on your system. If you want to use"
			echo "another AUR helper, please open an issue on the GitHub repo."
			exit 1
		fi
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
echo "When the game opens and starts"
echo "loading, you can close it again."
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
## optionally figure out a way with lutris
# is there a more beautiful way? (Don't want to download yet another file though.)
touch $HOME/rocksmith.sh
echo "#!/bin/bash" >> $HOME/rocksmith.sh
echo "cd \"$game\"" >> $HOME/rocksmith.sh
echo "WINEPREFIX=\"$prefix\" \"$runner/bin/wine\" \"$game/Rocksmith2014.exe\"" >> $HOME/rocksmith.sh
chmod u+x $HOME/rocksmith.sh

echo
echo "==============================================="
echo "All done so far. Please Set up JACK, preferably"
echo "in Cadence. You can use qjackctl too."
echo "Instructions for that are in my guide."
echo
echo "To run the game, start JACK, have Steam"
echo "opened, then run ~/rocksmith.sh"
echo
echo "Please log out and back in, so that your groups"
echo "and permissions are reloaded."
echo "==============================================="
echo

cadence

exit 0
