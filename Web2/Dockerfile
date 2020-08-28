FROM ubuntu:latest

RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php php-mysql nano wget unzip dovecot-imapd dovecot-pop3d
RUN a2enmod ssl
RUN service dovecot restart

COPY berger.ephec-ti.be.conf /etc/apache2/sites-available
COPY b2b.berger.ephec-ti.be.conf /etc/apache2/sites-available
COPY intranet.berger.ephec-ti.be.conf /etc/apache2/sites-available

RUN ln -s /etc/apache2/sites-available/berger.ephec-ti.be.conf /etc/apache2/sites-enabled
RUN ln -s /etc/apache2/sites-available/b2b.berger.ephec-ti.be.conf /etc/apache2/sites-enabled
RUN ln -s /etc/apache2/sites-available/intranet.berger.ephec-ti.be.conf  /etc/apache2/sites-enabled

RUN mkdir /var/www/b2b.berger.ephec-ti.be
RUN mkdir /var/www/berger.ephec-ti.be
RUN mkdir /var/www/intranet.berger.ephec-ti.be

COPY WT_Public/WT_Public.html /var/www/berger.ephec-ti.be/index.html
COPY WT_B2B/WT_B2B.html /var/www/b2b.berger.ephec-ti.be/index.html
COPY WT_Intranet/WT_Intranet.html /var/www/intranet.berger.ephec-ti.be/index.html

#installer le client mail "SquirrelMail"
WORKDIR /tmp
RUN wget https://sourceforge.net/projects/squirrelmail/files/stable/1.4.22/squirrelmail-webmail-1.4.22.zip
RUN unzip squirrelmail-webmail-1.4.22.zip
RUN mv squirrelmail-webmail-1.4.22 /var/www/html/
RUN chown -R www-data:www-data /var/www/html/squirrelmail-webmail-1.4.22/
RUN chmod 755 -R /var/www/html/squirrelmail-webmail-1.4.22/
RUN mv /var/www/html/squirrelmail-webmail-1.4.22/ /var/www/html/mail
COPY Mail/config.php /var/www/html/mail/config
RUN mkdir /var/local/mail
RUN mkdir /var/local/mail/data/
RUN chmod 777 /var/local/mail/data/
RUN rm squirrelmail-webmail-1.4.22.zip
RUN cd /

EXPOSE 80 443

CMD apachectl -DFOREGROUND