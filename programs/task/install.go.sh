#!/bin/bash

go install github.com/go-task/task/v3/cmd/task@latest
Or you can install into another directory:

env GOBIN=/bin go install github.com/go-task/task/v3/cmd/task@latest
