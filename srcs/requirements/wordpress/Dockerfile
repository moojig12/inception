FROM debian:bullseye

RUN apt update -y && apt install -y php-fpm

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/.

RUN mkdir /run/php/

CMD ["php-fpm7.4", "-F"]