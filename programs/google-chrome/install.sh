#!/bin/bash

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
# manage keyring files in trusted.gpg.d now
sudo apt install google-chrome-stable

# https://github.com/bgrins/devtools-snippets/tree/master/snippets/allcolors

alias snippets-backup="jq .devtools.preferences.scriptSnippets $HOME/.config/google-chrome/Default/Preferences \
| jq '. | fromjson' > /tmp/backup.json"
# # Tested with jq-1.6
# # The script converts json entries into lines of format
# # `filename[TAB]content-in-base64` and then
# # for each line creates the corresponding file
# # with the content decoded.

# # Better be in a safe directory!!
# mkdir /tmp/snippets-backup
# cd /tmp/snippets-backup

# jq .devtools.preferences.scriptSnippets ~/.config/chromium/Default/Preferences \
#   | jq '. | fromjson | .[]| [ .name, @base64 "\(.content)" ] | @tsv' -r \
#   | xargs -I{} /bin/bash -c 'file=$(echo "{}"|cut -f1); fileContent=$(echo "{}"|cut -f2); echo "$fileContent" | base64 -d > "${file}.js"'

alias snippets-view="jq .devtools.preferences.scriptSnippets $HOME/.config/google-chrome/Default/Preferences \
| jq '. | fromjson'"

# chrome://flags/#enable-force-dark,  devtools -> preferences -> theme -> dark
ghq get -l https://github.com/zenorocha/codecopy
echo "nodejs 15.14.0" > .tool-versions # fork and update manifest by 2023
npm install
npm run build
# Load unpacked: ~/ghq/github.com/zenorocha/codecopy/dist

# create 'Development'
# extensions, developer mode:
#  vimium-c:
#  redux-devtools: https://chrome.google.com/webstore/detail/redux-devtools/
#    - https://github.com/reduxjs/redux-devtools/extension
#  react-developer-tools: https://chrome.google.com/webstore/detail/react-developer-tools/
#  remotedev-devtools: https://chrome.google.com/webstore/detail/remotedev-devtools/
#  nodejs-v8-inspector-manag: https://chrome.google.com/webstore/detail/nodejs-v8-inspector-manag
#  github-nodejs-require-nav: https://chrome.google.com/webstore/detail/github-nodejs-require-nav/
#  graphql-network-inspector: https://chrome.google.com/webstore/detail/graphql-network-inspector/
#  json-formatter: https://chrome.google.com/webstore/detail/json-formatter/
#  cssviewer: https://chrome.google.com/webstore/detail/cssviewer/
#  talend-api-tester-free-ed: https://chrome.google.com/webstore/detail/talend-api-tester-free-ed/
#    - disable
#  livereload++: https://chrome.google.com/webstore/detail/livereload%2B%2B/ciehpookapcdlakedibajeccomagbfab?hl=en
#  # graphql-devtools: https://chrome.google.com/webstore/detail/graphql-devtools/
#  # altair-graphql-tools: https://chrome.google.com/webstore/detail/altair-graphql-client/

# TODO: copy styles from ~/.config/google-chrome
# TODO: create desktop link for development user launch
