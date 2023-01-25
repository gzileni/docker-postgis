#!/bin/sh

# Before PostgreSQL can function correctly, the database cluster must be initialized:
initdb -D /var/lib/postgres/data

# internal start of server in order to allow set-up using psql-client
# does not listen on external TCP/IP and waits until start finishes
pg_ctl -D "/var/lib/postgres/data" -o "-c listen_addresses=''" -w start

# create a user or roles
psql -d postgres -c "CREATE USER geodata WITH PASSWORD 'geodata';" 

# create database 
psql -v ON_ERROR_STOP=1 -d postgres -c "CREATE DATABASE geodata OWNER 'geodata';"

# stop internal postgres server
pg_ctl -v ON_ERROR_STOP=1 -D "/var/lib/postgres/data" -m fast -w stop

exec "$@"