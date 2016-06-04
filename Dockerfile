FROM resin/rpi-raspbian

MAINTAINER Thomas Dannenmuller

ARG SERVER_IMAGE=z-way-server-RaspberryPiXTools-v2.2.2.tgz

RUN apt-get -y update && \
    apt-get -yq install --no-install-recommends sharutils tzdata gawk libc-ares2 libavahi-compat-libdnssd-dev libarchive-dev libcurl3 libssl1.0.0 wget && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

RUN ln -s /usr/lib/arm-linux-gnueabihf/libarchive.so.13 /usr/lib/arm-linux-gnueabihf/libarchive.so.12

RUN mkdir -p /opt && \
    wget -q razberry.z-wave.me/z-way-server/${SERVER_IMAGE} && \
    tar -zxvf ${SERVER_IMAGE} -C /opt/ && \
    rm ${SERVER_IMAGE}

EXPOSE 8083/tcp

VOLUME /opt/z-way-server/automation/storage

ENV LD_LIBRARY_PATH=/opt/z-way-server/libs

WORKDIR /opt/z-way-server

CMD ["--log-file=/dev/stdout"]

ENTRYPOINT ["./z-way-server"]
