FROM debian:stretch

# Installation
RUN apt-get update && apt-get upgrade -y

# Requirements
RUN apt-get install postfix -y 
RUN apt-get install dovecot-core dovecot-imapd dovecot-pop3d -y 
RUN apt-get install libsasl2-2 libsasl2-modules sasl2-bin -y 
RUN apt-get install rsyslog mailutils -y

# Configuring postfix user
RUN groupadd -g 5000 vmail 
RUN useradd -s /usr/sbin/nologin -u 5000 -g 5000 vmail 
RUN usermod -aG vmail postfix 
RUN usermod -aG vmail dovecot

# Create directories and files
RUN mkdir /etc/dovecot/ssl 
RUN mkdir /mail-server 
RUN mkdir /mail-server/scripts 
RUN touch /var/log/dovecot 
RUN chgrp vmail /var/log/dovecot
RUN chmod 660 /var/log/dovecot 
RUN touch /etc/postfix/virtual_mailbox 
RUN touch /etc/postfix/virtual_domains 
RUN touch /etc/postfix/virtual_mailbox 
RUN touch /etc/postfix/virtual_alias

WORKDIR /etc/dovecot/ssl
RUN openssl req -new -outform PEM -out smtpd.cert -newkey rsa:2048 -nodes \
  -keyout smtpd.key -keyform PEM -days 365 -x509 \
  -subj "/C=BE/ST=Wavre/L=Wavre/O=WoodyToys/OU=IT Department/CN=wt1-3.ephec-ti.be"  
  
  
 
# Copy templates
COPY templates/postfix/main.cf /etc/postfix/main.cf
COPY templates/postfix/master.cf /etc/postfix/master.cf
COPY templates/dovecot/dovecot.conf /etc/dovecot/dovecot.conf

# Copy scripts
COPY /scripts/docker_entryfile.sh /mail-server/scripts/
COPY /scripts/configure.sh /mail-server/scripts/
COPY /scripts/new_email.sh /mail-server/scripts/
RUN chmod +x /mail-server/scripts/*

# ENV variables
ENV DOMAIN ""
ENV USERNAME ""
ENV PASSWORD ""

# Volumes for configuration
VOLUME /var/spool/mail/vhosts

RUN chmod u+rwx,g+rwx-w,o+rwx /var/spool/mail/vhosts

# Expose volumes
EXPOSE 25
EXPOSE 143

# Launching command
CMD /mail-server/scripts/docker_entryfile.sh
