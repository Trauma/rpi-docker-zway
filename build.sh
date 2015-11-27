ID=$(docker build -t geirgp/rpi-zway-server .) # This build and tag the image with creack/node:latest
docker tag $ID geirgp/rpi-zway-server:2.1.2-rc17-44  # Add a new tag
docker tag $ID geirgp/rpi-zway-server:latest   # You can use this and skip the -t part from build
