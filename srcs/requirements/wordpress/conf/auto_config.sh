#!/bin/bash
sleep 10

# Path to the WordPress directory
WP_PATH='/var/www/wordpress'

# Check if wp-config.php already exists
if [ ! -e $WP_PATH/wp-config.php ]; then
    echo "wp-config.php not found. Creating from wp-config-sample.php..."

    # Copy the sample config file to wp-config.php
    cp $WP_PATH/wp-config-sample.php $WP_PATH/wp-config.php

    # Update database configuration using sed
    sed -i "s/database_name_here/$SQL_DATABASE/" $WP_PATH/wp-config.php
    sed -i "s/username_here/$SQL_USER/" $WP_PATH/wp-config.php
    sed -i "s/password_here/$SQL_PASSWORD/" $WP_PATH/wp-config.php
    sed -i "s/localhost/mariadb:3306/" $WP_PATH/wp-config.php

    # Add additional configuration settings
    echo "define( 'WP_HOME', 'https://$DOMAIN_NAME' );" >> $WP_PATH/wp-config.php
    echo "define( 'WP_SITEURL', 'https://$DOMAIN_NAME' );" >> $WP_PATH/wp-config.php

    # Generate and add the unique authentication keys and salts
    curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> $WP_PATH/wp-config.php

    # Enable debugging
    echo "define('WP_DEBUG', true);" >> $WP_PATH/wp-config.php
    echo "define('WP_DEBUG_LOG', true);" >> $WP_PATH/wp-config.php
    echo "define('WP_DEBUG_DISPLAY', false);" >> $WP_PATH/wp-config.php

    echo "wp-config.php created successfully."
else
    echo "wp-config.php already exists. Skipping creation."
fi

# Ensure the /run/php directory exists
if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

# Wait for the database to be available
while ! mysqladmin ping -h mariadb --silent; do
    sleep 1
done

# Run WP-CLI commands to complete setup
if ! wp core is-installed --allow-root --path=$WP_PATH; then
    echo "Installing WordPress..."
    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="$SITE_TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --allow-root \
        --path=$WP_PATH

    wp user create \
        --allow-root \
        --role=author \
        $USER1_LOGIN \
        $USER1_MAIL \
        --user_pass=$USER1_PASS \
        --path=$WP_PATH

    echo "WordPress installed successfully."
else
    echo "WordPress is already installed. Skipping installation."
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F
