FROM ubuntu:14.04
MAINTAINER Wodby <admin@wodby.com>

RUN apt-get update && apt-get install -y nfs-kernel-server

RUN mkdir -p /exports
WORKDIR /exports
VOLUME /exports

EXPOSE 111/udp 2049/tcp

COPY docker-entrypoint.sh /usr/local/bin/
CMD "docker-entrypoint.sh"
