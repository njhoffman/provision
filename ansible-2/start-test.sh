#!/bin/bash

BUILDTAG="ubuntu:19.10"
IMAGE_NAME="test_${BUILDTAG}"
CONTAINER_NAME="ansible-test"
VERBOSITY="v" # v, vv, vvv, or blank

# make dockerfile with buildtag
make BUILDTAG="$BUILDTAG"

# stop and remove old containers
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null
echo "Stopped and removed docker container: $CONTAINER_NAME"

### build and run docker image
cd docker
docker build -t $IMAGE_NAME .

docker run \
  -ti \
  --privileged \
  --name $CONTAINER_NAME \
  -d \
  -p 5000:22 \
  $IMAGE_NAME

### run ansible playbook, keep container open
export ANSIBLE_STDOUT_CALLBACK=debug
cd ..
ansible-playbook \
  -i "env/local_docker" \
  test.yml \
  -${VERBOSITY} \


