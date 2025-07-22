#!/bin/bash

# mysqld_safe

# until mysqladmin ping --silent; do
#   echo "Waiting for MariaDB to start..."
#   sleep 1
# done

# echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pass' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql

# ./temp/init.sql < db1.sql

# mv ./temp/init.sql /etc/mysql/.

echo "CREATE DATABASE IF NOT EXISTS ${db1_name} ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '${db1_user}'@'%' IDENTIFIED BY '${db1_pass}' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON ${db1_name}.* TO '${db1_user}'@'wordpress.inception' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# /etc/mysql/init.sql < db1.sql

cat db1.sql > /etc/mysql/init.sql

chmod -w /etc/mysql/init.sql

# mysql_upgrade
mysqld