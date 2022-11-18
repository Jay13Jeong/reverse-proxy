#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --datadir=/var/lib/mysql --user=mysql
mysqld --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
CREATE DATABASE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED by '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';
FLUSH PRIVILEGES;
EOF
mysqld --user=mysql --console
