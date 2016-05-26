# rpi-docker-zway
Z-Way server Docker container for Z-Wave razberry (Raspberry Pi)

Note: Uses the 2.2.2 version of z-way.

## Building
If you need help getting docker onto your rpi check out this site:
http://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/

### Simple build :
```
git clone https://github.com/trauma/rpi-docker-zway.git
cd rpi-docker-zway
./build.sh
```
### Custom build :

You can choose your z-way server version on build. Just pick the file name of the desired version from this [url](http://razberry.z-wave.me/z-way-server/) ( *file name ex.* z-way-server-RaspberryPiXTools-X.X.X.tgz ) :


```
git clone https://github.com/trauma/rpi-docker-zway.git
cd rpi-docker-zway
docker build --build-arg="file_name_of_desired_zway_version" -t "your_repo"/rpi-docker-zway .
```
#### Example ( and default behavior ) :
```
docker build --build-arg=z-way-server-RaspberryPiXTools-v2.2.2.tgz -t tromatik/rpi-docker-zway .
```
## Running it

### Deployment script :

If you use the deployment script the ```config``` volume will be mounted to the current directory.

```
git clone https://github.com/trauma/rpi-docker-zway.git
cd rpi-docker-zway
sudo ./deploy.sh
```

### Custom run :

```
docker run -d -p "your_tcp_port":8083 --device /dev/ttyAMA0:/dev/ttyAMA0 -v "path_to_your_volume_mount":/opt/config/ tromatik/rpi-docker-zway:latest
```
