# Create a container from DEBIAN
FROM debian:buster

# Update apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# Install WGET to download the WordPress source code
RUN apt-get -y install wget curl

# Install PHP 7.3 and its dependencies
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# Download WordPress 6.0 from wordpress.org into /var/www/ and extract it
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

# Copy PHP configuration
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

# Set permissions for the WordPress directory
RUN chown -R www-data:www-data /var/www/wordpress

# Install WP-CLI to manage WordPress installation
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy auto_config script
COPY conf/auto_config.sh /auto_config.sh

# Make sure the auto_config.sh script is executable
RUN chmod +x /auto_config.sh

# Entry point to start the auto_config.sh script
ENTRYPOINT ["/auto_config.sh"]