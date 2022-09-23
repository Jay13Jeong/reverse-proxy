#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql

# init database
mysql_install_db --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null


# allow remote connections

# sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec mysqld --user=mysql --console

# 	cat << EOF > $tfile
# USE mysql;
# FLUSH PRIVILEGES;

# DELETE FROM	mysql.user WHERE User='';
# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';

# CREATE DATABASE $MARIADB_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '$MARIADB_USER'@'%' IDENTIFIED by '$MARIADB_PASSWORD';
# GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';

# FLUSH PRIVILEGES;
# EOF