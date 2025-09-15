#!/bin/bash
set -euo pipefail

echo "[mariadb] starting initialization"


MYSQL_ROOT_PASSWORD="$(cat /run/secrets/db_root_pass.txt)"
MYSQL_PASSWORD="$(cat /run/secrets/db_pass.txt)"

: "${MYSQL_DATABASE:?MYSQL_DATABASE is required}"
: "${MYSQL_USER:?MYSQL_USER is required}"

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Initialize DB if empty
if [ ! -d /var/lib/mysql/mysql ]; then
  echo "[mariadb] initializing datadir"
  mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in the background
mysqld_safe --datadir=/var/lib/mysql &
mysqld_pid=$!

# Wait until MariaDB is ready
for i in {1..60}; do
  if mysqladmin ping --silent > /dev/null 2>&1; then
    break
  fi
  sleep 1
done

echo "[mariadb] setting root passwords"
mysql -u root <<-EOSQL
  ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
  ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
  FLUSH PRIVILEGES;
EOSQL

echo "[mariadb] creating database and user"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
  CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
  CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
  GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
  FLUSH PRIVILEGES;
EOSQL

# Shutdown temporary server
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Start MariaDB in foreground
exec mysqld_safe
