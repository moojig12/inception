#!/bin/bash
set -euo pipefail

MYSQL_ROOT_PASSWORD="$(cat /run/secrets/db_root_pass.txt)"
MYSQL_PASSWORD="$(cat /run/secrets/db_pass.txt)"

: "${MYSQL_DATABASE:?MYSQL_DATABASE is required}"
: "${MYSQL_USER:?MYSQL_USER is required}"

# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then
  echo "[mariadb] initializing datadir"
  mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql &
mysqld_pid=$!

for i in {1..60}; do
  if mysqladmin ping --silent > /dev/null 2>&1; then
    break
  fi
  sleep 1
done

# if mariadb -uroot -e "SELECT 1" >/dev/null 2>&1; then
#   echo "[mariadb] setting root password"
#   mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
# fi

echo ${MYSQL_DATABASE} ${MYSQL_PASSWORD} ${MYSQL_ROOT_PASSWORD} ${MYSQL_USER}

echo "[mariadb] ensuring database and user"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

echo before
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
echo after
exec mysqld_safe