#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]
  then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Prepare AMA0
grep console=ttyAMA0 /boot/cmdline.txt > /dev/null 2>&1
if [[ $? -ne 1 ]]
  then
    sed -i 's/console=ttyAMA0,115200//; s/kgdboc=ttyAMA0,115200//' /boot/cmdline.txt && echo "cmdline patch succed!" || echo "cmdline patch failed!!!"
    sed -i 's|[^:]*:[^:]*:respawn:/sbin/getty[^:]*ttyAMA0[^:]*||' /etc/inittab && echo "inittab patch succed!" || echo "inittab patch failed!!!"
    echo "Rebooting the pi, please run this script again after reboot!"
    reboot
fi

container="zway"
image="tromatik/rpi-docker-zway:latest"

docker inspect $image > /dev/null 2>&1
if [[ $? -eq 0 ]]
  then
    echo "Building $image..."
    docker build -t $image .
fi

docker inspect $container > /dev/null 2>&1
if [[ $? -eq 0 ]]
  then
    echo "Removing previous $container container..."
    docker rm -f $container
fi

echo "Creating $container container..."
docker create --name=$container \
      -p 8083:8083 \
      --device /dev/ttyAMA0:/dev/ttyAMA0 \
      -v $(pwd)/z-way-server/:/opt/z-way-server/ \
      $image

read -t 5 -p "Do you want to start "$container" container? [Y/n] (Timeout 5 sec.) : " item
case "$item" in
 y|Y) docker start $container;;
 n|N) exit 0;;
 *) docker start $container;;
esac

echo "Please wait..."
sleep 5
docker ps -l
