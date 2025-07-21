FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install mariadb-server -y

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld"]