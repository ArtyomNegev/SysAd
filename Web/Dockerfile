FROM ubuntu:latest

RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt install -y apache2 php php-mysql nano 
RUN a2enmod ssl

COPY wt1-3.ephec-ti.be.conf /etc/apache2/sites-available
COPY b2b.wt1-3.ephec-ti.be.conf /etc/apache2/sites-available
COPY intranet.wt1-3.ephec-ti.be.conf /etc/apache2/sites-available

RUN ln -s /etc/apache2/sites-available/wt1-3.ephec-ti.be.conf /etc/apache2/sites-enabled
RUN ln -s /etc/apache2/sites-available/b2b.wt1-3.ephec-ti.be.conf /etc/apache2/sites-enabled
RUN ln -s /etc/apache2/sites-available/intranet.wt1-3.ephec-ti.be.conf  /etc/apache2/sites-enabled

RUN mkdir /var/www/b2b.wt1-3.ephec-ti.be
RUN mkdir /var/www/wt1-3.ephec-ti.be
RUN mkdir /var/www/intranet.wt1-3.ephec-ti.be

COPY WT_Public/WT_Public.html /var/www/wt1-3.ephec-ti.be/index.html
COPY WT_B2B/WT_B2B.html /var/www/b2b.wt1-3.ephec-ti.be/index.html
COPY WT_Intranet/WT_Intranet.html /var/www/intranet.wt1-3.ephec-ti.be/index.html

EXPOSE 80 443

CMD apachectl -DFOREGROUND

#sudo docker run -d --name web -h web-container --net=host artyomnegev/sysad2020_web:1.2
