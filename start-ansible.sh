#!/bin/bash

TARGET="main.yml"
TAGS=""
# SKIP_TAGS="elasticsearch,kibana,logstash"

export PY_COLORS=1
export ANSIBLE_FORCE_COLOR=1
export ANSIBLE_VERBOSITY=1
#  best output plugings: debug, unixy, yaml, json, minimal, default, actionable, profile_tasks
export ANSIBLE_STDOUT_CALLBACK=yaml
# breaks in debug mode on fail
# export ANSIBLE_ENABLE_TASK_DEBUGGER=1
######################################################

[[ -n "$1" ]] && TAGS="$1"

TAGS_ARG=""
[[ -n $TAGS ]] && TAGS_ARG="--tags $TAGS"
[[ -n $SKIP_TAGS ]] && TAGS_ARG="--skip-tags $SKIP_TAGS"

ansible-playbook -i "env/local" \
  $TAGS_ARG $TARGET

## install ansible:
# https://github.com/ansible/ansible.git
# pip install ansible-core
# sudo python setup.py install
