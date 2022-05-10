#!/bin/bash

# auto update repositories
user="<user>"
repo="<repo>"
crontab -e

# */0 11 * * * bash -c 'cd "$(/usr/local/bin/navi info cheats-path)/<user>__<repo>" && /usr/local/bin/git pull -q origin master'
git clone "https://github.com/${user}/${repo}" "$(navi info cheats-path)/${user}__${repo}"
