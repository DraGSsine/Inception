#!/bin/bash
#---------------------------------------------------wp installation---------------------------------------------------#
mkdir /run/php
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html
#---------------------------------------------------wait for mariadb---------------------------------------------------#
sleep 20
#---------------------------------------------------wp installation---------------------------------------------------#
wp core download --allow-root
wp core config --dbhost=mariadb --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_N --admin_password=$WP_ADMIN_P --admin_email=$WP_ADMIN_E --allow-root
wp user create $WP_U_NAME $WP_U_EMAIL --user_pass=$WP_U_PASS --role=$WP_U_ROLE --allow-root

#---------------------------------------------------Install Redis Object Cache Plugin---------------------------------------------------#
wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp redis enable --allow-root
#---------------------------------------------------php config---------------------------------------------------#
sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F