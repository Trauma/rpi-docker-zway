FROM hypriot/rpi-node

MAINTAINER tromatik@gmail.com

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends sharutils tzdata gawk libavahi-compat-libdnssd-dev wget libarchive-dev && \
    apt-get clean

RUN ln -s /usr/lib/arm-linux-gnueabihf/libarchive.so.13 /usr/lib/arm-linux-gnueabihf/libarchive.so.12

RUN mkdir -p /etc/z-way

RUN wget -O /tmp/z-way-server.tgz -q http://razberry.z-wave.me/z-way-server/z-way-server-RaspberryPiXTools-v2.2.2.tgz \
    && echo "v2.2.2" > /etc/z-way/VERSION

ADD start-zway.sh /bin/start-zway
ADD install.sh /bin/install-zway

VOLUME ["/opt"]

EXPOSE 8083/tcp

ENTRYPOINT ["/bin/start-zway"]
