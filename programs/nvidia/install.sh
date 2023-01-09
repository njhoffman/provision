#!/bin/bash
# https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia

sudo apt install mesa-utils glmark2 

sudo apt install git qtdeclarative5-dev cmake
# To get Nvidia System Monitor from Git, build and install it, use:
ghq get -l congard/nvidia-system-monitor-qt
sudo install icon.png /usr/share/icons/hicolor/512x512/apps/nvidia-system-monitor-qt.png
mkdir build
cmake -DCMAKE_BUILD_TYPE=Release -DIconPath=/usr/share/icons/hicolor/512x512/apps/nvidia-system-monitor-qt.png -B build -G "Unix Makefiles"
cmake --build build --target qnvsm -- -j 4
sudo install build/qnvsm /usr/local/bin

# https://github.com/Syllo/nvtop#distribution-specific-installation-process
sudo add-apt-repository ppa:flexiondotorg/nvtop
sudo apt install nvtop
# sudo apt install cmake libncurses5-dev libncursesw5-dev git
# git clone https://github.com/Syllo/nvtop.git
# mkdir -p nvtop/build && cd nvtop/build
# cmake .. -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON -DINTEL_SUPPORT=ON
# make
#
# # Install globally on the system
# sudo make install
# Alternatively, install without privileges at a location of your choosing
# make DESTDIR="/your/install/path" install
