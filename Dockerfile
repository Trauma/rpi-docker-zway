FROM sdhibit/rpi-raspbian

MAINTAINER Thomas Dannenmüller <tromatik@gmail.com>

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends wget && \
    apt-get clean

RUN ln -s /usr/lib/arm-linux-gnueabihf/libarchive.so.13 /usr/lib/arm-linux-gnueabihf/libarchive.so.12

RUN wget -q -O - razberry.z-wave.me/install | bash

ADD start-zway.sh /bin/start-zway

VOLUME ["/opt"]

EXPOSE 8083/tcp

ENTRYPOINT ["/bin/start-zway"]
