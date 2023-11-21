#!/bin/bash

# https://github.com/ggerganov/llama.cpp
./server -m models/7B/ggml-model.gguf -c 2048
make
cmake --build . --config Release

# test with curl
curl --request POST \
  --url http://localhost:8080/completion \
  --header "Content-Type: application/json" \
  --data '{"prompt": "Building a website can be done in 10 simple steps:","n_predict": 128}'
