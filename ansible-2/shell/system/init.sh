#!/bin/bash
# initialize vagrant user and core packages

msg "Updating APT repository"
apt-get update -y

msg "Upgrading OS files"
apt-get upgrade -y

msg "Adding Core Utilities"
apt-get install -y \
	adduser \
	apt-transport-https \
	aptitude \
	bc \
  build-essential \
	init-system-helpers \
	libc6-dbg \
	libevent-dev \
	libfontconfig \
	liblua5.1-dev \
	libluajit-5.1 \
	libncurses5-dev \
	libperl-dev \
  linuxbrew-wrapper \
	linux-tools-generic \
	locate \
	luajit \
	software-properties-common \
	zip \
	zsh

msg "Initializing vagrant user"
groupadd server-admins
useradd -g server-admins vagrant
groupadd vboxsf
useradd -g vboxsf vagrant
usermod -a -G staff vagrant

msg "Installing Java"
add-apt-repository ppa:linuxuprising/java
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EA8CACC073C3DB2A
apt-get update -y
apt-get install -y default-jdk
