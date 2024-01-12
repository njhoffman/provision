#!/usr/bin/env bash

VERSION=4.1.0
curl --location --remote-name \
  "https://github.com/Orange-OpenSource/hurl/releases/download/$VERSION/hurl_$VERSION_amd64.deb"

sudo apt update && sudo apt install "./hurl_$VERSION_amd64.deb"

# tutorial
docker pull ghcr.io/jcamiel/hurl-express-tutorial:latest
docker run --name movies --rm --detach --publish 3000:3000 ghcr.io/jcamiel/hurl-express-tutorial:latest

# or
git clone https://github.com/jcamiel/hurl-express-tutorial.git && cd hurl-express-tutorial
npm install
npm start

hurl basic.hurl
hurl --test basic.hurl
