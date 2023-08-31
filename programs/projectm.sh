#!/bin/bash

cd ~/.local/src && git clone https://github.com/projectM-visualizer/projectm
cd projectm
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
cmake --build . -- -j && sudo cmake --build . --target install 
