#!/bin/bash

gh auth login

# https://github.com/chelnak/gh-changelog

# gh-cli post-install: install github extensions:
gh extension install mislav/gh-branch
gh extension install yusukebe/gh-markdown-preview
gh extension install davidraviv/gh-clean-branches

# gh extension install k1LoW/gh-grep
# gh grep func.*schema.Schema --include=**/*.go --owner k1LoW --repo tbls
# List base Docker images used in the Dockerfile of the project root
# $ gh grep ^FROM --include=Dockerfile --owner k1LoW
# List Actions you are using
# $ gh grep uses: --include=.github/workflows/* --owner k1LoW | sed -e 's/.*uses:\s*//g' | sort | uniq -c
# Open the matched lines in a browser.
# $ gh grep 'ioutil\.' --include=**/*.go --owner k1LoW --repo ghput --url
# $ gh grep 'ioutil\.' --include=**/*.go --owner k1LoW --repo ghput --url | xargs open

# gh extension install heaths/gh-label

# neofetch for user profile
gh extension install sheepla/gh-userfetch
# gh userfetch

gh extension install mislav/gh-cp
# Usage: gh cp <repo> <path> <dest>
# gh cp cli/cli pkg/findsh/find_windows.go .

gh extension install kawarimidoll/gh-graph
# gh graph

gh extension install gennaro-tedesco/gh-f

gh extension install gennaro-tedesco/gh-s
# gh s neovim

# lists repos that are starred, prints full url
gh extension install korosuke613/gh-user-stars
# gh user-stars

# dashboard for pull requests and issues
gh extension install dlvhdr/gh-dash

# ~/.config/gh-dash/config.yml
# prSections:
#   - title: My Pull Requests
#     filters: is:open author:@me
#   - title: Needs My Review
#     filters: is:open review-requested:@me
#   - title: Subscribed
#     filters: is:open -author:@me repo:cli/cli repo:dlvhdr/gh-dash
#     limit: 50 # optional limit per section
# issuesSections:
#   - title: Created
#     filters: is:open author:@me
#   - title: Assigned
#     filters: is:open assignee:@me
#   - title: Subscribed
#     filters: is:open -author:@me repo:microsoft/vscode repo:dlvhdr/gh-dash
# defaults:
#   prsLimit: 20 # global limit
#   issuesLimit: 20 # global limit
#   preview:
#     open: true
#     width: 60
