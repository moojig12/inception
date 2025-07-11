FROM debian:buster

RUN apt install -y ^^ apt upgrade -y

RUN apt-get install nginx -y && apt-get install openssl -y

COPY ./tools/script.sh /


CMD [ "/script.sh" ]