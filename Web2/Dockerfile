FROM ubuntu:latest

RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt install -y apache2 php php-mysql nano 
RUN a2enmod ssl
#RUN apt install software-properties-common -y && add-apt-repository ppa:certbot/certbot -y && apt update && apt install certbot -y

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

EXPOSE 80 443

CMD apachectl -DFOREGROUND

#sudo docker run -d --name web -h web-container --net=host artyomnegev/sysad2020_web:1.3
