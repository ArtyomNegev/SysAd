FROM ubuntu:latest

RUN apt-get update && apt-get install -y asterisk

RUN sed -i "s/rtpstart=10000/rtpstart=16384/g" /etc/asterisk/rtp.conf
RUN sed -i "s/rtpend=20000/rtpend=16394/g" /etc/asterisk/rtp.conf

WORKDIR /etc/asterisk

VOLUME /etc/asterisk
VOLUME /var/lib/asterisk/moh

#configuration visant à définir un utilisateur
COPY voip/users.conf /etc/asterisk/users.conf

#configuration du comportement des connexions via le serveur
COPY voip/extensions.conf /etc/asterisk/extensions.conf

EXPOSE 5060/udp
EXPOSE 16384-16394/udp

# execute asterisk en tache de fond
CMD asterisk -fvvvvvvvvvr
