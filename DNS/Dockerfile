FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9

COPY db.internal.wt1-3.ephec-ti.be /etc/bind/
COPY db.wt1-3.ephec-ti.be /etc/bind/
COPY named.conf /etc/bind/
COPY named.conf.local /etc/bind/
COPY named.conf.options /etc/bind/
COPY named.conf.default-zones /etc/bind/

EXPOSE 53

CMD named -g
