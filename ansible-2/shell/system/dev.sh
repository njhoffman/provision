#!/bin/bash
# system development utilities

msg "Installing build essentials"
apt-get install -y \
	automake \
	autotools-dev \
	build-essential \
	dirmngr \
  gcc \
  gcc-multilib \
  g++-multilib \
	git \
	make \
  mercurial \
	pkg-config

msg "Installing C/C++ utilities"
apt-get install -y \
	cmake \
	g++ \
	gdb \
	valgrind

msg "Installing Python"
apt-get install -y \
	python3 \
	python3-dev \
	python3-pip
#	python \
#	python-dev \
#	python-pip

pip install ipython

msg "Installing Ruby"
apt-get install -y \
	ruby \
	ruby-dev
gem install bundler

msg "Installing misc dev utilities"
apt-get install -y \
  silversearcher-ag \
  taskwarrior \
  tig

# pip install "bugwarrior[jira]"
pip3 install "pip-review"
