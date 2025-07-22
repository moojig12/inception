FROM debian:bullseye

RUN apt update -y && apt install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql
COPY ./tools/init_setup.sh .
COPY ./tools/script.sh .

RUN chmod +rwx /etc/mysql/init.sql

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["./script.sh"]