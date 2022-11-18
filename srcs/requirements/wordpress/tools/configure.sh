#!/bin/sh

wp core download --allow-root
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
wp core install --url=localhost/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
wp theme install aeonium --activate --allow-root

wp config set WP_REDIS_HOST 'redis' --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_TIMEOUT 1 --allow-root
wp config set WP_REDIS_READ_TIMEOUT 1 --allow-root
wp config set WP_REDIS_DATABASE 0 --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

mv /resume/* /var/www/html

/usr/sbin/php-fpm7
