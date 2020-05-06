FROM ubuntu:latest

RUN apt-get update && apt-get -y install asterisk

RUN sed -i "s/rtpstart=10000/rtpstart=16384/g" /etc/asterisk/rtp.conf
RUN sed -i "s/rtpend=20000/rtpend=16394/g" /etc/asterisk/rtp.conf
    
COPY extensions.conf /etc/asterisk/extensions.conf
COPY sip.conf /etc/asterisk/sip.conf
COPY users.conf /etc/asterisk/users.conf
COPY voicemail.conf /etc/asterisk/voicemail.conf
COPY iax.conf /etc/asterisk/iax.conf

EXPOSE 5060 5060/udp
EXPOSE 16384/udp
EXPOSE 16385/udp
EXPOSE 16386/udp
EXPOSE 16387/udp
EXPOSE 16388/udp
EXPOSE 16389/udp
EXPOSE 16390/udp
EXPOSE 16391/udp
EXPOSE 16392/udp
EXPOSE 16393/udp
EXPOSE 16394/udp

CMD ["/usr/sbin/asterisk", "-f"]
