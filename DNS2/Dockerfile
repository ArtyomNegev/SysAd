FROM ubuntu:latest

RUN apt update && apt upgrade -y && apt install bind9 -y

COPY named.conf /etc/bind/
COPY named.conf.options /etc/bind/
COPY named.conf.zones /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.internal.berger.ephec-ti.be /etc/bind/
COPY db.berger.ephec-ti.be /etc/bind/

EXPOSE 53

CMD named -g

#sudo docker run -d --name dns -h dns-container --net=host artyomnegev/sysad2020_dns:1.2
