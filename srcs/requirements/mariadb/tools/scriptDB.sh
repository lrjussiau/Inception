#!/bin/bash

service mysql start 


echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> db1.sql
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld