#!/bin/bash

service mysql start 


echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> db1.sql
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# service mysql start;
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE_NAME}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USERNAME}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE_NAME}\`.* TO \`${SQL_USERNAME}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe


# service mysql start 
# echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql

# mysql < db1.sql

# mysqladmin -u root password '12345'
# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld
