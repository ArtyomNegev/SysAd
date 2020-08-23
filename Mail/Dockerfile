FROM ubuntu:latest

# Mise à jour systèmesystemd
RUN apt-get update && apt-get upgrade -y

# Installation des packages
RUN apt-get install postfix -y 
RUN apt-get install dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd -y 
RUN apt-get install nfs-common nano rsyslog mailutils systemd net-tools telnet -y 

# Configuration des utilisateurs postfix
RUN groupadd -g 3109 groupmail 
RUN useradd -s /usr/sbin/nologin -u 3109 -g 3109 groupmail 
RUN usermod -aG groupmail postfix 
RUN usermod -aG groupmail dovecot

# Copie des fichiers de configuration
COPY Postfix/main /etc/postfix/main
COPY Postfix/virtual /etc/postfix/virtual
COPY Dovecot/conf /etc/dovecot/conf
COPY Dovecot/auth /etc/dovecot/conf.d/auth
COPY Dovecot/mail /etc/dovecot/conf.d/mail
COPY Dovecot/master /etc/dovecot/conf.d/master
COPY Dovecot/ssl /etc/dovecot/conf.d/ssl

RUN cat /etc/dovecot/conf > /etc/dovecot/dovecot.conf
RUN cat /etc/dovecot/conf.d/auth > /etc/dovecot/conf.d/10-auth.conf
RUN cat /etc/dovecot/conf.d/ssl > /etc/dovecot/conf.d/10-ssl.conf
RUN cat /etc/dovecot/conf.d/master > /etc/dovecot/conf.d/10-master.conf
RUN cat /etc/dovecot/conf.d/mail > /etc/dovecot/conf.d/10-mail.conf
RUN cat /etc/postfix/main > /etc/postfix/main.cf
RUN cd /etc/postfix
RUN postmap /etc/postfix/virtual

# Exposition des ports
EXPOSE 25 110 143 587

# Commandes
#CMD ["service dovecot restart && service postfix restart"]
CMD /etc/init.d/dovecot start