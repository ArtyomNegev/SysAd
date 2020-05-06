FROM ubuntu:latest

RUN apt update -y && apt upgrade -y &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential wget libssl-dev libncurses5-dev nano \
    libnewt-dev libxml2-dev uuid-dev \
    libsqlite3-dev libjansson-dev  \
    libedit* \
    subversion && \
    wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17-current.tar.gz && \
    tar -xzvf asterisk-17-current.tar.gz &&  \
    cd asterisk-17.*/  && \
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
    
COPY voip/extensions.conf /etc/asterisk/extensions.conf
COPY voip/sip.conf /etc/asterisk/sip.conf
COPY voip/users.conf /etc/asterisk/users.conf
COPY voip/voicemail.conf /etc/asterisk/voicemail.conf
COPY voip/iax.conf /etc/asterisk/iax.conf

EXPOSE 5060/udp
EXPOSE 10000-20000/udp

CMD asterisk -fvvvvvvvvvr
