<!-- https://www.reddit.com/r/linux_gaming/comments/jmediu/guide_for_setup_rocksmith_2014_steam_no_rs_cable/ -->
<!-- https://www.reddit.com/r/linux_gaming/comments/j6ok9y/rocksmith_2014_remastered_focusrite_solo_2i2usb/ -->

Hello! So, i got Rocksmith 2014 working with JACK and minimal(~10ms) latency.

History:
First, i tried NoCableLauncher-solution, but i was not satisfied with lags of all my audio setup (headphones, external speakers, microphone and linear-in.... all routing from programs (Discord, game chats, OBS, etc). It's because for patch working you absolutely need to disable all other inputs... Second i tried DirectConnect-mode. I got it working, nice sound and volume, but with really big and noticable delay. Also i tried ALSA mode with this, and also got delays... I tried different buffer sizes with ALSA, tried editing .asoundrc file with adding dsnoops on my hw, but delays about 100ms haven't gone. Plus after every Steam/cache checking cache.psarc will revert to original, so i decided to drop that. With JACK, WineASIO, RS_ASIO i got game working perfectly: no noticable delay, seamless launch (just launch it from steam and connect guitar and you're ready to go), now i can route sound to/from game, easy setup recording, and it's awesome. I would like to share my setup with you.

You will need:
    Linux (I get it working with Debian 10. With rpm-based systems you will need other commands for installing stuff)
    Rocksmith 2014 - license from Steam
    sudo rights for installing stuff.

First, we need to make sure that the game runs with Proton. Download the game, in Properties check the box "Force the use of a specific Steam Play compatibility tool", check "Proton". Launch the game. You should get all things working without sound (or with error from Wine about sound).

# JACK
In the next step we will install JACK. If you already have JACK installed and configured, skip this. Install jackd, qjackctl.

sudo apt install jackd2 qjackctl
For managing JACK i use apps Cadence and Carla. You can use QjackCtl, but i found managing plugins and connecting stuff harder on it. Install Cadence and Carla:

```bash
  sudo apt install apt-transport-https gpgv
  wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
  sudo dpkg -i kxstudio-repos_10.0.3_all.deb
  sudo apt update
  sudo apt install cadence carla
```

## Configure JACK
If you already configured JACK you can skip this.

Launch Cadence. On the main screen tick "Auto-start JACK or LADISH at login".

If you want to use realtime priorities: Click "Configure" -> "Engine", tick "Realtime". You don't have to boot realtime kernel for this! For actually using realtime priorities you need to check three more things. On the Debian 10 jackd created file /etc/security/limits.d/audio.conf with right lines while installation. I've only needed to add myself to audio group like so:

```bash
  sudo groupadd audio
  sudo usermod -aG audio $(id -un)
```

In Driver tab check "ALSA", and in Device/Interface choose your primary sound interface. Names of the interfaces could be somewhat gibberish, you can get extra information about them from terminal command aplay -l for outputs and arecord -l for inputs. You can use Duplex mode, if you want separate input/output. JACK will use these exclusively, you will not be able to set another ALSA or Pulse client for these. At that window you could also setup Sample Rate and buffer size.

Sample Rate: Rocksmith wants 48000khz for input and output.

A few words about buffer size. Basically, more buffer size -> more latency and more stability less buffer size -> less latency, but increasing risc of buffer underrun, or "Xruns" - audible clicks and distortion of sound.

You need to find balance with not so high latency and absence of Xruns. For most people buffer size 512 is enough, considering today's CPU. Buffer 512 corresponds to ~10.3ms of latency. If you have good CPU, you could try lower the buffer to 256 (5ms). On my system (i7 7700k) I get too many Xruns with 256. If you got Xruns with 512, you can increase the buffer even more.

Now back to the main screen, press "Start". You should get "Server Status: Started", and PulseAudio "Bridged". Now you have virtual sound "Sink" for all of your applications with name "JACK sink". Make it default. Check the sound from browser/Discord/etc. Check that you have "JACK sink" output for all apps.

Let's say you setup JACK Input for your Linear-in. If you configure JACK inputs for another input, you need JACK client for your Linear-In. Find your device in arecord -l list. Find 'card' number and 'device' number. Run command alsa_in -d hw:$CARD,$DEVICE -j LINE_IN. You can insert that command in your .rc files, so it will run at startup or login. Now you should return to JACK routing app and find your LINE_IN JACK client.

# Installing ASIO
Now the things gets trickier. You need to enable WineASIO for Rocksmith. Install WineASIO. If you added kxstudio repos earlier, you could run:

You need to copy wineasio.dll.so from your system to Proton directory.

In Steam -> Library in dropping list check "Tools", find Proton you use in Rocksmith. After that go to Properties - Browse local files. That is yours PROTON_DIR.

```bash
  sudo apt install wineasio
  # Copy wineasio.dll.so to $PROTON_DIR/dist/lib/wine
  # CHANGE PROTON_DIR TO YOURS
  PROTON_DIR=/SteamLibrary/steamapps/common/Proton\ 5.0
  cp /usr/lib/i386-linux-gnu/wine/wineasio.dll.so $PROTON_DIR/dist/lib/wine
```

After that you need to enable ASIO library for the game. For that you need to find directory with compatdata. 

```bash
  # You need to change STEAM_LIBRARY_ROOT with your path
  cd $STEAM_LIBRARY_ROOT/compatdata/221680
  # Register wineasio.dll for that wineprefix
  WINEPREFIX=$(realpath pfx) regsvr32 wineasio.dll
  # Launch winecfg
  WINEPREFIX=$(realpath pfx) winecfg
```

You will get windows-styled window with settings of the game. Go to the "Libraries" tab, type in wineasio. Now click "Add". Then in list of libraries find added "wineasio", click "Edit", choose "Builtin then Native". Apply all and close the window.


In Cadence you need to set WineAsio buffer to your value you set before.

# Installing RS_ASIO
Now you need to install RS_ASIO patch. For that you need to copy avrt.dll, RS_ASIO.dll and RS_ASIO.ini to the game folder. Change content of RS_ASIO.ini like that:

``
BufferSizeMode=host
;...
[Asio.Output]
Driver=WineASIO
BaseChannel=0
;....
;....
[Asio.Input.0]
Driver=WineASIO
BaseChannel=0
In Rocksmith.ini check that lines:

ExclusiveMode=1
LatencyBuffer=4
ForceWDM=0
Win32UltraLowLatencyMode=1
``

# Route sound
And now the most interesting part. Launch Catia (or other JACK routing app). Launch the game. Switch it to the windowed mode. In Catia you will see new JACK client, named "Rocksmith2014". Now you can route sound from your system input to inputs on Rocksmith, and output sound from it to system output.

Probably you get something similar to this

After routing sound you should hear your guitar and the game. Enjoy!

# One more thing
After that you could use some deeper sound-routing setup with Carla, if you want. I will give you some idea:

Very, very useful apps for guitar on Linux: Tonelib GFX for audio-processing and Tonelib JAM for tabs and play-along.

I installed Tonelib GFX, in Carla added plugin "Tonelib-GFX", connect it to my playback, and turn off guitar in Rocksmith's mixer completely. Now i can use my presets (or online presets) in Tonelib with the game in parallel. My Carla looks like this

Connect EQ plugin before the game. Use it to increase volume for calibration-in-game.

You could use PitchShifter from ToneLib GFX for "Eb standart" or "E 429 smthsmth" tunings for example.

After installing OBS you could easy record the game and guitar and micro all separate from each other at different channels. In OBS you can use "Sound capture (JACK client)" and connect it to your clients.

If you have problems with background noise you can use any Filter/Noise reduction VST/LV2 plugin, connect it before the game. (Noise reduction from Tonelib-GFX works too)
