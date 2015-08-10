FROM ubuntu:14.04.3
MAINTAINER Stuart Marsden <stuartmarsden@finmars.co.uk>

RUN apt-get update
RUN apt-get install -y xvfb x11vnc x11-apps
RUN apt-get install -y wget libjbig0 libtcl8.5 libtiff5 libtk-img libtk8.5 tcl8.5 tk8.5
RUN apt-get install -y openbox
RUN apt-get install -y bridge-utils ebtables iproute libev4 libev-dev python libxml2 libprotobuf8 python-protobuf libpcap0.8 libpcre3 libuuid1 libace-6.0.3 python-lxml python-setuptools
RUN apt-get install -y traceroute mgen openssh-server iperf tcpdump wireshark
RUN wget http://downloads.pf.itd.nrl.navy.mil/core/packages/4.8/core-gui_4.8-0ubuntu1_trusty_all.deb
RUN wget http://downloads.pf.itd.nrl.navy.mil/core/packages/4.8/core-daemon_4.8-0ubuntu1_trusty_amd64.deb
RUN wget http://downloads.pf.itd.nrl.navy.mil/ospf-manet/quagga-0.99.21mr2.2/quagga-mr_0.99.21mr2.2_amd64.deb
RUN dpkg -i core-gui_4.8-0ubuntu1_trusty_all.deb core-daemon_4.8-0ubuntu1_trusty_amd64.deb quagga-mr_0.99.21mr2.2_amd64.deb
RUN wget http://adjacentlink.com/downloads/emane/emane-0.9.2-release-1.ubuntu-14_04.amd64.tar.gz
RUN tar zxvf emane-0.9.2-release-1.ubuntu-14_04.amd64.tar.gz
RUN dpkg -i emane-0.9.2-release-1/debs/ubuntu-14_04/amd64/emane*.deb

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd coreemu ~/.vnc/passwd
RUN rm -r *.deb emane-0.9.2-release-1*
ADD startCore.sh startCore.sh

EXPOSE 5900
CMD ["/bin/bash", "/startCore.sh"]
