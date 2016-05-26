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
### Custom build:

You can choose your z-way server version on build. Just pick the file name of the desired version from this url (z-way-server-RaspberryPiXTools-X.X.X.tgz) :
http://razberry.z-wave.me/z-way-server/

```
git clone https://github.com/trauma/rpi-docker-zway.git
cd rpi-docker-zway
docker build --build-arg="file_name_of_desired_zway_version" -t "your_repo"/rpi-docker-zway .
```
#### Example ( and default behavior ):
```
docker build --build-arg=z-way-server-RaspberryPiXTools-v2.2.2.tgz -t tromatik/rpi-docker-zway .
```
## Running it

```
git clone https://github.com/trauma/rpi-docker-zway.git
cd rpi-docker-zway
sudo ./deploy.sh
```
