#!/bin/bash

# I installed Tonelib GFX, in Carla added plugin "Tonelib-GFX", connect it to my playback, and turn off guitar in Rocksmith's mixer completely. Now i can use my presets (or online presets) in Tonelib with the game in parallel. My Carla looks like this
# Connect EQ plugin before the game. Use it to increase volume for calibration-in-game.
# You could use PitchShifter from ToneLib GFX for "Eb standart" or "E 429 smthsmth" tunings for example.
# After installing OBS you could easy record the game and guitar and micro all separate from each other at different channels. In OBS you can use "Sound capture (JACK client)" and connect it to your clients.
# If you have problems with background noise you can use any Filter/Noise reduction VST/LV2 plugin, connect it before the game. (Noise reduction from Tonelib-GFX works too)

sudo apt install libgl1-mesa-glx

cd ~/Downloads

# ToneLib GFX
wget https://www.tonelib.net/download/ToneLib-GFX-amd64.deb
sudo dpkg --install ./ToneLib-GFX-amd64.deb

# ToneLib Jam
wget https://www.tonelib.net/download/ToneLib-Jam-amd64.deb
sudo dpkg --install ./ToneLib-Jam-amd64.deb

# ToneLib Metal
wget https://www.tonelib.net/download/ToneLib-Metal-amd64.deb

# ToneLib NoiseReducer
wget https://www.tonelib.net/download/ToneLib-NoiseReducer-amd64.deb

# ToneLib BassDrive
wget https://www.tonelib.net/download/ToneLib-BassDrive-amd64.deb

# ToneLib TubeWarmth
wget https://www.tonelib.net/download/ToneLib-TubeWarmth-amd64.deb

# ToneLib Zoom
wget https://www.tonelib.net/download/ToneLib-Zoom-amd64.deb
