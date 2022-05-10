#!/bin/bash

sudo apt install mkvtoolnix

mkvmerge --split duration:00:10:00.000 input_file.mkv -o split.mkv
