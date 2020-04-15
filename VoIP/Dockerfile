FROM ubuntu:latest

RUN apt update -y && apt upgrade -y &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential wget libssl-dev libncurses5-dev nano \
    libnewt-dev libxml2-dev uuid-dev \
    libsqlite3-dev libjansson-dev  \
    subversion \
    libedit-dev libedit2 && \
    wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz && \
    tar -xzvf asterisk-16-current.tar.gz &&  \
    cd asterisk-16.*/  && \
    ./contrib/scripts/get_mp3_source.sh && \
    ./configure && \
    make menuselect.makeopts && \
    menuselect/menuselect \
    --enable CORE-SOUNDS-FR-ULAW \
    --enable MOH-OPSOUND-ULAW \
    --enable EXTRA-SOUNDS-FR-ULAW \
    menuselect.makeopts && \
    make && make install  && make samples && make config && \
    apt-get clean

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
CMD ["/usr/sbin/asterisk", "-f"]
