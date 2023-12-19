#!/bin/bash

# cd base && podman build -t try.nvim:base-stable --build-arg VERSION=release-0.6 .
# cd base && podman build -t try.nvim:base-nightly --build-arg VERSION=master .

# cd lua && podman build -t try.nvim:stable-lua --build-arg TAG=base-stable .
# cd lua && podman build -t try.nvim:nightly-lua .
# podman run --rm -it --cap-add SYS_PTRACE try.nvim:nightly-lua

# cd c && podman build -t try.nvim:stable-c --build-arg TAG=base-stable .
# cd c && podman build -t try.nvim:nightly-c .

# cd typescript && podman build -t try.nvim:stable-typescript --build-arg TAG=base-stable .
# cd typescript && podman build -t try.nvim:nightly-typescript .
# podman run --rm -it --cap-add SYS_PTRACE try.nvim:nightly-typescript

LATEST_STABLE=0.6
VERSIONS=("nightly","stable")
VARIANTS=("lsp-c","lsp-lua","lsp-rust","lsp-typescript")

REGISTRY="njh"
REPO="nvim"
VERSION="nightly"
VARIANT="lsp-python"


base_tag="${REGISTRY}/${REPO}:base-${VERSION}"
base_arg="VERSION=release-${LATEST_STABLE}"
[[ $VERSION == "nightly" ]] && base_arg="VERSION=master"

build_tag="${REGISTRY}/${REPO}:${VARIANT}-${VERSION}"
build_arg="TAG=${VARIANT}-${VERSION}"

build_arg="VERSION=release-${LATEST_STABLE}"
[[ $VERSION == "nightly" ]] && build_arg="VERSION=master"

function build_podman {
  echo "$VARIANT" "$VERSION" "$build_arg" "$build_tag"
  cd "$VARIANT" && \
    podman build -t "$build_tag" --build-arg "$build_arg" . && \
    podman run --rm -it --cap-add SYS_PTRACE "$build_tag"
}


function build_docker {
  # BUILDKIT requires existing base images
  cd "./base" && DOCKER_BUILDKIT=0 \
    docker build -t "$base_tag" --build-arg "$base_arg" . \
    | bat -l conf --color=always && \
cd "../$VARIANT" && \
    docker build -t "$build_tag" --build-arg "$build_arg" . && \
    docker run --rm -it --name "nvim-${VARIANT}" \
    --cap-add SYS_PTRACE "$build_tag"
}

build_docker
