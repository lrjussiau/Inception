# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ljussiau <ljussiau@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/25 17:40:07 by jcluzet           #+#    #+#              #
#    Updated: 2024/05/14 11:09:36 by ljussiau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ==> Create a container from DEBIAN
FROM debian:buster

# ==> MAJ of apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# ==> Install NGinx server 
RUN apt install nginx -y

# ==> Install OpenSSL to generate a self-signed certificate
RUN apt-get install openssl -y

# ==> Create the repertory for the certificate and the key
RUN mkdir -p /etc/nginx/ssl

# ==> Generate a self-signed certificate and key
RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
-subj "/C=CH/ST=VAUD/L=Lausanne/O=42/OU=42/CN=ljussiau.42.fr/UID=ljussiau" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# ==> Copy the nginx.conf file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# ==> Use chmod to give the right to the user to edit html folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# ==> Start the nginx service
CMD [ "nginx", "-g", "daemon off;" ]
