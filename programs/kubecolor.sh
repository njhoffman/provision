#!/usr/bin/env bash

alias kubectl=kubecolor
gkubecolor --context my-context get pods
kubecolor edit deployment
kubecolor exec -it pod-a basho get github.com/hidetatz/kubecolor/cmd/kubecolor
