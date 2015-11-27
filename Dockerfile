From hypriot/rpi-node
MAINTAINER Geir Gullestad Pettersen
RUN apt-get -y update
RUN apt-get -qy install sharutils tzdata gawk libavahi-compat-libdnssd-dev wget libarchive-dev
RUN ln -s /usr/lib/arm-linux-gnueabihf/libarchive.so.13 /usr/lib/arm-linux-gnueabihf/libarchive.so.12
RUN mkdir -p /etc/z-way 

RUN wget -O /tmp/z-way-server.tgz -q http://razberry.z-wave.me/z-way-server/z-way-server-RaspberryPiXTools-v2.1.2-rc17-44-gd59bf28.tgz && echo "v2.1.2-rc17-44-gd59bf28" > /etc/z-way/VERSION

ADD start-zway.sh /bin/start-zway 
ADD install.sh /bin/install-zway 
#RUN touch /etc/z-way/box_type 
#RUN echo "razberry" > /etc/z-way/box_type

VOLUME ["/opt"] 
