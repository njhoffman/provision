#!/bin/bash

TARGET="prebuild.yml"
FLUSH_CACHE=0
VERBOSITY="" # v, vv, vvv, or blank
TAGS=".prebuild"
# SKIP_TAGS="elasticsearch,kibana,logstash"
export ANSIBLE_FORCE_COLOR=1
export PY_COLORS=1
export ANSIBLE_STDOUT_CALLBACK=yaml
######################################################

[[ -n "$1" ]] && TARGET="$1"

TAGS_ARG=""
[[ -n $TAGS ]] && TAGS_ARG="--tags $TAGS"
[[ -n $SKIP_TAGS ]] && TAGS_ARG="--skip-tags $SKIP_TAGS"
[[ -n "$VERBOSITY" ]] && VERBOSITY="-$VERBOSITY"

FLUSH_ARG=""
[[ $FLUSH_CACHE -ne 0 ]] && FLUSH_ARG=" --flush-cache"

ansible-playbook -i "env/local" \
  $FLUSH_ARG $TAGS_ARG $VERBOSITY $TARGET
