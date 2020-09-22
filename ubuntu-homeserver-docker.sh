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
docker run --name postgres12 \
  -e POSTGRES_PASSWORD=mysecretpassword \
#  -v /data/config/postgresql.conf:/etc/postgresql/postgresql.conf \
  -v /data/database/postgres:/var/lib/postgresql/data \
  -p 5432:5432 \
  -d postgres:12

# MongoDB
docker run --name mongodb -p 27017:27017 -v /data/database/mongodb:/data/db -d mongo:4-bionic mongod --replSet nx-repl-set
docker exec -it mongodb mongo
# Run on mongo shell: rs.initiate()

# Bitwarden
# Gen token using openssl rand -base64 48
docker run -d --name bitwarden \
  -e SIGNUPS_ALLOWED=false \
  -e ADMIN_TOKEN=your_admin_token_here \
  -e WEBSOCKET_ENABLED=true \
  -v /data/database/bitwardenrs/:/data/ \
  -p 16000:80 \
  -p 16001:3012 \
  bitwardenrs/server:testing
  
# Adguard home
docker run --name adguardhome \
  -v /data/database/adguardhome:/opt/adguardhome/work \
  -v /data/config/adguardhome:/opt/adguardhome/conf \
  -p 53:53/tcp \
  -p 53:53/udp \
  -p 67:67/udp \
  -p 68:68/tcp \
  -p 68:68/udp \
  -p 80:80/tcp \
  -p 443:443/tcp \
  -p 853:853/tcp \
  -p 3000:3000/tcp \
  -d adguard/adguardhome

# n8n.io - Workflow Automation Tool
docker run -d \
	--name n8n \
	-p 16010:5678 \
	-e GENERIC_TIMEZONE="Asia/Ho_Chi_Minh" \
	-e TZ="Asia/Ho_Chi_Minh" \
	-v /data/database/n8n:/root/.n8n \
	n8nio/n8n
