#!/usr/bin/env bash

docker run -it \
  mcr.microsoft.com/azure-cli:$VERSION

# include ssh keys from user environment
docker run -it -v ${HOME}/.ssh:/root/.ssh mcr.microsoft.com/azure-cli

docker run -it mcr.microsoft.com/azure-cli

docker pull mcr.microsoft.com/azure-cli
