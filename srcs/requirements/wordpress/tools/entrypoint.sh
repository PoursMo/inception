#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
sleep 10
wp config create --dbname=${DB_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWD} --dbhost=mariadb --allow-root 
wp core install --url=aloubry.42.fr --title=inception --admin_user=${WP_ADM} --admin_password=${WP_ADM_PASSWD} --admin_email=aloubry@student.42lausanne.ch --allow-root
wp user create ${WP_USER} ${WP_USER_EMAIL} --allow-root
exec "$@"