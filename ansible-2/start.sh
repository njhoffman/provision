#!/bin/bash

VERBOSITY="v" # v, vv, vvv, or blank
FLUSH_CACHE=0
TAGS="kubernetes"
# SKIP_TAGS="elasticsearch,kibana,logstash"
export ANSIBLE_STDOUT_CALLBACK=debug

######################################################

TAGS_ARG=""
[[ -n $TAGS ]] && TAGS_ARG="--tags $TAGS"
[[ -n $SKIP_TAGS ]] && TAGS_ARG="--skip-tags $SKIP_TAGS"

if [[ $FLUSH_CACHE == 0 ]]; then
  ansible-playbook \
    -e ansible_python_interpreter=/usr/bin/python3 \
    -i "env/local" \
    --ask-become-pass \
    main.yml \
    $TAGS_ARG \
    -${VERBOSITY}
else
  ansible-playbook \
    -e ansible_python_interpreter=/usr/bin/python3 \
    -i "env/local" \
    --ask-become-pass \
    --flush-cache \
    main.yml \
    $TAGS_ARG \
    -${VERBOSITY}
fi
