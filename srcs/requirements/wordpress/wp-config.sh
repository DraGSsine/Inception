#!/bin/bash

# Set up WP-CLI
mkdir -p /run/php
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Change to the web root directory
cd /var/www/html

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -h"mariadb" --silent; do
    sleep 1
done

# WordPress installation
echo "Installing WordPress..."
wp core download --allow-root
wp core config --dbhost=mariadb --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN_N --admin_password=$WP_ADMIN_P --admin_email=$WP_ADMIN_E --allow-root
wp user create $WP_U_NAME $WP_U_EMAIL --user_pass=$WP_U_PASS --role=$WP_U_ROLE --allow-root

# Check if WordPress is installed successfully
if wp core is-installed --allow-root; then
    echo "WordPress installed successfully."
    
    # Install and configure Redis Object Cache Plugin
    echo "Installing Redis Object Cache Plugin..."
    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    
    # Check if the plugin is active before enabling Redis
    if wp plugin is-active redis-cache --allow-root; then
        echo "Redis Object Cache Plugin installed and activated."
        wp redis enable --allow-root
    else
        echo "Failed to activate Redis Object Cache Plugin."
    fi
else
    echo "WordPress installation failed."
fi

# PHP-FPM configuration
sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Start PHP-FPM
/usr/sbin/php-fpm7.4 -F