FROM debian:buster


RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/scriptDB.sh /
RUN chmod +x /scriptDB.sh

CMD ["/scriptDB.sh"]
