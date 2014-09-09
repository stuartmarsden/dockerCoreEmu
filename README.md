## CoreEmu Docker

This container is for [CoreEmu](http://www.nrl.navy.mil/itd/ncs/products/core).

The image is based on the official [Ubuntu 14.04 image](https://registry.hub.docker.com/_/ubuntu/).

This image will run the Core-GUI and the server. This will be available through VNC on exposed port 5900

### Usage

Run the image to use it:

    docker run -d --privileged -p 5900:5900 stuartmarsden/dockercoreemu

It must be run with privileged or it cannot create namespaces within the container which is needed for Core. You can then use a VNC client and connect on localhost:5900

Most useful tools are included like:
* Wireshark
* Mgen
* iperf
* Openssh server

Known issues:
* Tcpdump does not seem to work within docker. Wireshark does though
