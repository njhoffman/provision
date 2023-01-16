#!/bin/bash

sudo apt-get install \
  btrfs-progs \
  crun \
  git \
  golang-go \
  go-md2man \
  iptables \
  libassuan-dev \
  libbtrfs-dev \
  libc6-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libgpgme-dev \
  libgpg-error-dev \
  libprotobuf-dev \
  libprotobuf-c-dev \
  libseccomp-dev \
  libselinux1-dev \
  libsystemd-dev \
  pkg-config

# Make sure that the Linux kernel supports user namespaces:
#
# > zgrep CONFIG_USER_NS /proc/config.gz
# CONFIG_USER_NS=y
#
# If not, please update the kernel. For Manjaro Linux the instructions can be found here: https://wiki.manjaro.org/index.php/Manjaro_Kernels
#
# After that enable user namespaces:
#
# sudo sysctl kernel.unprivileged_userns_clone=1
# To enable the user namespaces permanently:
#
# echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/userns.conf

# conmon
# The latest version of conmon is expected to be installed on the system. Conmon is used to monitor OCI Runtimes. To build from source, use the following:
#
# git clone https://github.com/containers/conmon
# cd conmon
# export GOCACHE="$(mktemp -d)"
# make
# sudo make podman
# crun / runc
# The latest version of at least one container runtime is expected to be installed on the system. crun or runc are some of the possibilities, and one is picked up as the default runtime by Podman (crun has priority over runc). Supported versions of crun or runc are available for example on Ubuntu 22.04. runc version 1.0.0-rc4 is the minimal requirement, which is available since Ubuntu 18.04.
#
# To double-check, runc --version should produce at least spec: 1.0.1, otherwise build your own:
#
# git clone https://github.com/opencontainers/runc.git $GOPATH/src/github.com/opencontainers/runc
# cd $GOPATH/src/github.com/opencontainers/runc
# make BUILDTAGS="selinux seccomp"
# sudo cp runc /usr/bin/runc
# CNI plugins
# Setup CNI networking
# A proper description of setting up CNI networking is given in the cni README.
#
# A basic setup for CNI networking is done by default during the installation or make processes and no further configuration is needed to start using Podman.
#
# Add configuration
# sudo mkdir -p /etc/containers
# sudo curl -L -o /etc/containers/registries.conf https://src.fedoraproject.org/rpms/containers-common/raw/main/f/registries.conf
# sudo curl -L -o /etc/containers/policy.json https://src.fedoraproject.org/rpms/containers-common/raw/main/f/default-policy.json
# Optional packages
# Fedora, CentOS, RHEL, and related distributions:
#
# (no optional packages)
#
# Debian, Ubuntu, and related distributions:
#
# apt-get install -y \
#   libapparmor-dev
# Get Source Code
# First, ensure that the go version that is found first on the $PATH is 1.16.x or higher. Instruction above will help you compile newer version of Go if needed. Then we can build Podman:
#
# git clone https://github.com/containers/podman/
# cd podman
# make BUILDTAGS="selinux seccomp"
# sudo make install PREFIX=/usr
# Build Tags
# Otherwise, if you do not want to build Podman with seccomp or selinux support you can add BUILDTAGS="" when running make.
#
# make BUILDTAGS=""
# sudo make install
