#!/bin/bash

POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-libxml --with-openssl" \
  asdf install postgres

createuser --username postgres --superuser spadash
createuser --username postgres --superuser rdsadmin
createdb -O spadash spadash
cd ~/env/spadash/local || exit
psql spadash <./sql/dumps/2022-04-25.1028.sql
