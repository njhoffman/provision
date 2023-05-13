#!/bin/bash

cargo install --git https://github.com/loichyan/nerdfix.git

nerdfix check test/test-data.txt

# find all files that contain obsolete icons
nerdfix check --format=json -r /path/to/root 2> /dev/null |
  jq -s -r '[.[].path] | sort | unique | .[]'

# recursively fix skip interactive prompts
nerdfix fix --write --select-first --recursive /path/to/root
