#!/bin/bash

service mariadb start
mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mariadb -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"
sleep 1
service mariadb stop
exec "$@"