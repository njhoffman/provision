#!/bin/bash

# Cherub Rock must be owned: https://store.steampowered.com/app/248750/Rocksmith_2014__The_Smashing_Pumpkins___Cherub_Rock/
# https://ignition4.customsforge.com/files/CDLCEnabler/RS2014-Mod-Installer.exe

RS="$HOME/.steam/steam/steamapps/common/Rocksmith2014"
cp "$(pwd)/D3DX9_42.dll" "$RS"
mkdir -p "$RS/dlc/custom"
cp -rv "/mnt/E_Download/Rocksmith/custom/*_p.psarc" "$RS/dlc/custom"
