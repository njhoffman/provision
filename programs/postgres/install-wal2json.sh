#!/bin/bash

# https://debezium.io/documentation/reference/stable/postgres-plugins.html

# Logical decoding is the process of extracting all persistent changes to a database’s tables into a coherent, easy to understand format which can be interpreted without detailed knowledge of the database’s internal state.
# As of PostgreSQL 9.4, logical decoding is implemented by decoding the contents of the write-ahead log, which describe changes on a storage level, into an application-specific form such as a stream of tuples or SQL statements. In the context of logical replication, a slot represents a stream of changes that can be replayed to a client in the order they were made on the origin server. Each slot streams a sequence of changes from a single database. The output plug-ins transform the data from the write-ahead log’s internal representation into the format the consumer of a replication slot desires. Plug-ins are written in C, compiled, and installed on the machine which runs the PostgreSQL server, and they use a number of PostgreSQL specific APIs, as described by the PostgreSQL documentation.
# Debezium’s PostgreSQL connector works with one of Debezium’s supported logical decoding plug-ins,
# protobuf or wal2json
# to encode the changes in either Protobuf format or JSON format.

ghq get -l eulerto/wal2json -b master --single-branch \
&& git checkout d2b7fef021c46e0d429f2c1768de361069e58696 \
&& make && make install

# postgresql.conf
# ############ REPLICATION ##############
# # MODULES
# shared_preload_libraries = 'wal2json'

# # REPLICATION
# wal_level = logical
# max_wal_senders = 4
# max_replication_slots = 4

# tells the server that it should load at startup the wal2json (use decoderbufs for protobuf) logical decoding plug-in(s) (the names of the plug-ins are set in protobuf and wal2json Makefiles)
# tells the server that it should use logical decoding with the write-ahead log
# tells the server that it should use a maximum of 4 separate processes for processing WAL changes
# tells the server that it should allow a maximum of 4 replication slots to be created for streaming WAL changes
