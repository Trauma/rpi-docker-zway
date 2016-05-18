

# rpi-docker-zway
Z-Way Z-Wave controller running on Raspberry Pi in a Docker container

Note: Uses the 2.2.2 version of z-way.


# Building
If you need help getting docker onto your rpi check out this site: http://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/


```git clone https://github.com/geirgp/rpi-docker-zway.git
cd rpi-docker-zway
docker build -t tromatik/rpi-docker-zway .
```
This will take a couple of minutes unless you have already downloaded the hypriot/rpi-node image.

# Running it
See https://hub.docker.com/r/tromatik/rpi-zway-server/
