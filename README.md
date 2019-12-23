mbentley/mongodb4.2
===================

docker image for mongodb 4.2
based off of debian:buster

To pull this image:
`docker pull mbentley/mongodb4.2`

Example usage:
`docker run -it -p 27017:27017 --name mongodb -v mongodb-data:/var/lib/mongodb mbentley/mongodb4.2`

By default, this runs a mongodb 4.2 server with no auth and listens on port 27017.
