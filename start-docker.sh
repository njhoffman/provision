#!/bin/bash
export PY_COLORS=1
export ANSIBLE_FORCE_COLOR=1
export ANSIBLE_VERBOSITY=1
export ANSIBLE_STDOUT_CALLBACK=yaml

DOCKER_CONTAINER_NAME="ansible-test"
DOCKER_IMAGE_NAME="local/ubuntu-20.10"

docker build -t $DOCKER_IMAGE_NAME ./docker/

docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 $DOCKER_IMAGE_NAME
# docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 -e AUTHORIZED_KEYS="$SSH_PUBLIC_KEY" local/centos7-systemd

ansible-playbook -i env/local_docker main.yml # -vvv

docker exec -it "$DOCKER_CONTAINER_NAME" /bin/bash

docker stop $DOCKER_CONTAINER_NAME
docker rm $DOCKER_CONTAINER_NAME
