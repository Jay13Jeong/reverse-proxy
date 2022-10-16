#!/bin/sh

mkdir -p /var/www/html
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php

/usr/sbin/php-fpm7