#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
# chown -R mysql:myscd /var/lib/mysql
# mysql_install_db --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
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

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec mysqld --user=mysql --console
