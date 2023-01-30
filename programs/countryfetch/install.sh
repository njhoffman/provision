#!/bin/bash

# install deno
curl -fsSL https://deno.land/x/install/install.sh | sh
ghq get -l CondensedMilk7/countryfetch
./install.sh
~/.deno/bin/countryfetch sync flags
