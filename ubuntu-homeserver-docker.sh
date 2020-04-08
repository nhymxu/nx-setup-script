#!/bin/bash

# Dz's Home Server docker
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#

# MariaDB
docker run --name mariadb -p 3306:3306 -v /data/database/mysql:/var/lib/mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes mariadb

# Clickhouse

# PostgreSQL

# MongoDB
