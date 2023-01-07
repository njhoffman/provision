#!/bin/bash
trap "exit" INT

# double-hashtag (## comment) means it is a TODO

# determines the distro, based on the package manager. This way, I don't need a list of child-distros.
# sets a few distro-specific variables
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
	echo "Your distro does not seem to be compatible. Exiting..."
	exit 1
fi

clear
echo "!! The provider of this script takes no responsibility  !!"
echo "!! and will not guarantee for this to work.             !!"
echo "!! This script is not compatible with pipewire.         !!"
echo "!!                                                      !!"
echo "!! The Script is experimental. I didn't really test it. !!"
echo

# determine the game's install location
echo "Please specify the root folder of the game's"
echo "installation. Should contain 'Rocksmith.exe'"
read -p "Rocksmith install path: " game
while [ ! -f "$game/Rocksmith2014.exe" ]; do
	echo
	echo "Invalid Path, please try again."
	read -p "Rocksmith install path: " game
done

# ask for prefix path
echo "Please specify the location of the prefix you"
echo "want to use. Contains 'dosdevices'"
echo "and 'drive_c'"
read -p "Prefix of the game: " prefix
while ! [ -d "$prefix/drive_c" -o -d "$prefix/dosdevices" ]; do # loop for correct answer
	echo
	echo "This doesn't seem to be a prefix, please try again."
	read -p "Prefix of the game: " prefix
done

echo "Please specify the root of the runner"
echo "installation that you want to use."
# read this
read -p "Runner: " runner
while ! [ -f "$runner/bin/wine" ]; do
	echo
	echo "This doesn't seem to be a runner installation path, please try again."
	read -p "Runner: " runner
done

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
		sudo pacman -S carla jack2 lib32-jack2 realtime-privileges # this can't be with noconfirm, because you might have to replace jack
		;;
	*)
		# this should be dead code, but just in case
		echo "This isn't supposed to happen. Please open"
		echo "an issue and inform the dev that the script"
		echo "continued without a valid 'dist' value."
		;;
esac

sudo groupadd audio
suod groupadd realtime
sudo usermod -aG audio $USER
sudo usermod -aG realtime $USER


cp "$x32dll" "$runner/lib/wine/i386-windows/wineasio.dll"
cp "$x32so" "$runner/lib/wine/i386-unix/wineasio.dll.so"
cp "$x64dll" "$runner/lib64/wine/x86_64-windows/wineasio.dll"
cp "$x64so" "$runner/lib64/wine/x86_64-unix/wineasio.dll"

mv "$prefix" "$prefix.bak" # backup old prefix. Not Steam

# tell user to close game once you see the loading screen
echo
echo "================================"
echo "Please start the game now."
echo "When the game opens and starts"
echo "loading, you can close it again."
echo "================================"
echo
read -p "Press enter to continue"

WINEPREFIX="$prefix" regsvr32 /usr/lib32/wine/i386-windows/wineasio.dll # register wineasio to prefix

# download RS_ASIO latest release, unpack to correct location, insert "WineASIO"
wget https://github.com/mdias/rs_asio/releases/download/v0.5.7/release-0.5.7.zip -O RS_ASIO.zip
unzip RS_ASIO.zip -d "$game"
rm "$game/RS_ASIO.ini"
wget https://raw.githubusercontent.com/theNizo/linux_rocksmith/main/RS_ASIO.ini -o "$game/RS_ASIO.ini"
rm RS_ASIO.zip
rm "$game/Rocksmith.ini"

if [ $dist = "arch" ]; then
	# create launch script; optionally figure out a way with lutris
	touch $HOME/rocksmith.sh
	echo "#!/bin/bash" >> $HOME/rocksmith.sh
	echo "cd \"$game\"" >> $HOME/rocksmith.sh
	echo "WINEPREFIX=\"$prefix\" \"$runner/bin/wine\" \"$game/Rocksmith2014.exe\"" >> $HOME/rocksmith.sh
	chmod u+x $HOME/rocksmith.sh

echo
echo "==============================================="
echo "All done so far. Please Set up JACK, preferably"
echo "in Carla. You can use qjackctl too."

if [ $dist = "arch" ]; then
	echo "To run the game, start JACK, have Steam"
	echo "opened, then run ~/rocksmith.sh"
else
	echo "To run the game, start JACK, then start"
	echo "the game in Steam."
fi

echo "==============================================="
echo

cadence

exit 0
