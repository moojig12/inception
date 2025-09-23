FROM    debian:bullseye

RUN     apt-get update && \
        apt-get install -y \
        mariadb-server && \
        rm -rf /var/lib/apt/lists/*

COPY    tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY    tools/mariadb.sh .

RUN     chmod +x ./mariadb.sh

CMD     [ "./mariadb.sh", "mysqld_safe"]