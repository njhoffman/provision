#!/bin/bash

name="strace-diag"

test_container="$1"

# Dockerfile
cat >Dockerfile <<EOF
	FROM alpine
	RUN apk update && apk add strace
	CMD ["strace", "-p", "1"]
EOF

docker build -t strace .

docker run -t --name $name \
	--pid=container:$test_container \
	--net=container:$test_container \
	--cap-add sys_admin \
	--cap-add sys_ptrace \
	strace -p 1
