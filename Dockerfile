FROM debian:buster

RUN apt install -y && apt upgrade -y

RUN apt-get install build-essentials

RUN apt-get install make

RUN apt-get install docker

RUN apt-get install bash

CMD ["bash"]