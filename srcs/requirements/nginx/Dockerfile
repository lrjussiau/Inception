FROM debian:buster

RUN apt update
RUN apt install -y nginx vim openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=ljussiau.42.fr/UID=ljussiau"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]