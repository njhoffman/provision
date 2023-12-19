#!/bin/bash

WORKDIR="/tmp/hyperfine"

docker run -it --rm \
	-v "${WORKDIR}:/performance/data" \
	-w /performance \
	-- nvim --headless +qa
