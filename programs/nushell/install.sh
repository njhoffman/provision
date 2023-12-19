#!/bin/bash

# https://github.com/nushell/nushell
# https://github.com/nushell/awesome-nu#plugins
cargo install nu

# https://github.com/JosephTLyons/nu_plugin_periodic_table
cargo install nu_plugin_periodic_table
# periodic-table | where g-block == "Noble Gas" | sort-by electroneg

# psql extension
# cargo install --git https://github.com/pka/nupsql
cd "$HOME/.local/src" || exit
git clone https://github.com/pka/nupsql
cd nupsql || exit
cargo update -p lexical-core
cargo update -p socket2
cargo build
cargo vendor
cargo install --path .
cd ..
rm -rfv nupsql
# psql postgresql://postgres@127.0.0.1/postgres "SELECT * FROM pg_stat_activity WHERE state IS NOT NULL" | pivot
