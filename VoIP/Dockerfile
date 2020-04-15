FROM ubuntu:latest

RUN apt-get update && apt-get install -y asterisk

RUN sed -i "s/rtpstart=10000/rtpstart=16384/g" /etc/asterisk/rtp.conf
RUN sed -i "s/rtpend=20000/rtpend=16394/g" /etc/asterisk/rtp.conf

COPY users.conf /etc/asterisk/users.conf
COPY extensions.conf /etc/asterisk/extensions.conf
COPY sip.conf /etc/asterisk/sip.conf
COPY voicemail.conf /etc/asterisk/voicemail.conf
COPY iax.conf /etc/asterisk/iax.conf

EXPOSE 5060/udp
EXPOSE 16384-16394/udp

# execute asterisk en tache de fond
CMD asterisk -fvvvvvvvvvr
