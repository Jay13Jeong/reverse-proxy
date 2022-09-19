#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
# chown -R mysql:myscd /var/lib/mysql
mysql_install_db --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
mysqld --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
CREATE DATABASE $WP_DATABASE_NAME;
CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED by '$WP_DATABASE_PWD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%';
FLUSH PRIVILEGES;
EOF

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec mysqld --user=mysql --console
