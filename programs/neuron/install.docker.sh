#!/bin/bash

# mount ~/zettelkasten /notes
docker run --rm -t -i -p 8080:8080 -v $(pwd):/notes sridca/neuron neuron gen -ws 0.0.0.0:8080

# emanote
# cd /path/to/notebook
# mkdir output.docker
# docker run \
#   -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
#   --tmpfs /tmp \
#   -v $PWD:/data \
#   sridca/emanote emanote -L "/data" gen /data/output.docker
# open ./output.docker/index.html
