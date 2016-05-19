#!/usr/bin/env bash

# Prepare AMA0
if [[ $(grep console=ttyAMA0 /boot/cmdline.txt) ]]
  then
    sed -i 's/console=ttyAMA0,115200//; s/kgdboc=ttyAMA0,115200//' /boot/cmdline.txt
    sed -i 's|[^:]*:[^:]*:respawn:/sbin/getty[^:]*ttyAMA0[^:]*||' /etc/inittab
fi

container="zway"
image="tromatik/rpi-docker-zway:latest"


if [[ $(docker inspect $container > /dev/null 2>&1) ]]
  then
	   docker rm -f $container
fi

docker create --name=$container \
      -p 8083:8083 \
      --device /dev/ttyAMA0:/dev/ttyAMA0 \
      -v $(pwd)/z-way-server/:/opt/z-way-server/ \
      $image

read -t 5 -p "Do you want to start "$container" container? [Y/n] : " item
case "$item" in
 y|Y) docker start $container;;
 n|N) exit 0;;
 *) docker start $container;;
esac

echo "Please wait..."
sleep 5
docker ps -l
