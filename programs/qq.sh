#!/bin/bash

https://github.com/JFryy/qq

# YAML → JSON
qq '.' config.yaml -o json

# TOML → YAML
qq '.' pyproject.toml -o yaml

# CSV → Parquet
qq '.' data.csv -o parquet

# Avro → JSON (schema embedded in OCF file)
qq '.' events.avro

# JSON → CBOR
qq '.' payload.json -o cbor

# XML → TOML
qq '.root' config.xml -o toml

# Terraform HCL → JSON (useful for scripting)
qq '.' infra.tf -o json

# Pipe formats freely
cat file.msgpack | qq -i msgpack -o yaml
# JSON is default in and output.
cat file.${ext} | qq -i ${ext}

# Extension is parsed, no need for input flag
qq '.' file.xml

# random example: query xml, grep with gron using qq io and output as json
qq file.xml -o gron | grep -vE "sweet.potatoes" | qq -i gron

# get some content from a site with html input
curl motherfuckingwebsite.com | bin/qq -i html '.html.body.ul.li[0]'

# interactive query builder mode on target file
qq . file.json --interactive

# streaming mode - works with JSON, YAML, CSV and more
qq --stream 'select(length == 2)' large.json

# slurp mode - read multiple inputs into an array
echo -e '{"id":1}\n{"id":2}' | qq -s 'map(.id)'

# exit-status - use in conditionals
echo '{"active":true}' | qq -e '.active' && echo "is active" 
 
