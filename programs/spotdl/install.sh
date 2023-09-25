#!/bin/bash

sudo apt install ffmpeg
git clone https://github.com/spotDL/spotify-downloader && cd spotify-downloader
pip install poetry
poetry install
poetry run python3 scripts/build.py
