#!/bin/bash

# Dz's Home Server docker
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#

# MariaDB
docker run --name mariadb -p 3306:3306 -v /data/database/mysql:/var/lib/mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes mariadb

# Clickhouse
docker run -d --name clickhouse-analytics-server -p 8123:8123 -p 9000:9000 -p 9009:9009  --ulimit nofile=262144:262144 --volume=/data/database/sclickhouse:/var/lib/clickhouse yandex/clickhouse-server
docker run -d --name clickhouse-analytics-server -p 8123:8123 -p 9000:9000 -p 9009:9009  --ulimit nofile=262144:262144 --volume=/data/database/sclickhouse:/var/lib/clickhouse -v /data/database/clickhouse_config.xml:/etc/clickhouse-server/config.xml yandex/clickhouse-server

# PostgreSQL

# MongoDB
docker run --name mongodb -p 27017:27017 -v /data/database/mongodb:/data/db -d mongo:4-bionic mongod --replSet nx-repl-set
docker exec -it mongodb mongo
# Run on mongo shell: rs.initiate()
