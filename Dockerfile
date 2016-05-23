FROM rpi-raspbian

MAINTAINER Thomas Dannenmuller

ARG SERVER_IMAGE=z-way-server-RaspberryPiXTools-v2.2.2.tgz

RUN apt-get -y update && \
    apt-get -yq install --no-install-recommends sharutils tzdata gawk libc-ares2 libavahi-compat-libdnssd-dev wget libarchive-dev && \
    apt-get autoclean

RUN ln -s /usr/lib/arm-linux-gnueabihf/libarchive.so.13 /usr/lib/arm-linux-gnueabihf/libarchive.so.12

RUN mkdir -p /opt/z-way-server && \
    cd /opt/z-way-server && \
    wget razberry.z-wave.me/z-way-server/${SERVER_IMAGE} && \
    tar --strip-components=1 -zxvf ${SERVER_IMAGE} && \
    rm ${SERVER_IMAGE}

VOLUME ["/opt"]

EXPOSE 8083/tcp

ENV LD_LIBRARY_PATH=/opt/z-way-server/libs

COPY entrypoint.sh /bin/entrypoint.sh

CMD ["/bin/entrypoint.sh"]
