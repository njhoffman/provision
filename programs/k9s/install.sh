#!/bin/bash

ghq get -l derailed/k9s
make build && ./execs/k9s
