FROM ubuntu:latest

RUN apt update && apt upgrade -y && \
apt-get install dnsutils -y && \
apt-get install nmap -y && \
apt-get install net-tools -y && \
apt-get install lynx -y

CMD named -g
