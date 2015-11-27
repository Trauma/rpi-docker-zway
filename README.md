

# rpi-docker-zway
Z-Way Z-Wave controller running on Raspberry Pi in a Docker container

Note: Uses the latest version of z-way available (release candidates). If you want to stick to stable releases go grab https://github.com/jayrockk/rpi-docker-zway instead.


# Building
If you need help getting docker onto your rpi check out this site: http://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/


```git clone https://github.com/geirgp/rpi-docker-zway.git
cd rpi-docker-zway
docker build -t geirgp/rpi-docker-zway . 
```
This will take a couple of minutes unless you have already downloaded the hypriot/rpi-node image.

# Running it 
See https://hub.docker.com/r/geirgp/rpi-zway-server/