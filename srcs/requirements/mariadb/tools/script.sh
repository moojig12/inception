#!/bin/bash

#db_name = Database Name
#db_user = User
#db_pwd = User Password
mysqld_safe &
sleep 5


echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

until mysqladmin ping --silent; do
	echo "Waiting for Maria to be ready..."
	sleep 2
done

mysql < db1.sql

wait