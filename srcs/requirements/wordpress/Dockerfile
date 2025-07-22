FROM debian:bullseye

RUN apt update -y && apt install -y php-fpm php-mysqli curl

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./tools/script.sh .

RUN mkdir /run/php/
RUN chmod +x script.sh

CMD ["./script.sh"]