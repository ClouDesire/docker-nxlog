FROM ubuntu:14.04
MAINTAINER Cloudesire team <dev@cloudesire.com>

RUN apt-get -y update && apt-get install -y -q wget debhelper automake \
        libapr1-dev libpcre3-dev  libssl-dev libdbi-dev libcap-dev \
        libexpat1-dev libtool libperl-dev autotools-dev xmlto dblatex

RUN wget -q -O - http://softlayer-dal.dl.sourceforge.net/project/nxlog-ce/nxlog-ce-2.8.1248.tar.gz | tar -xzf - -C /opt
WORKDIR /opt/nxlog-ce-2.8.1248/packaging/debian
RUN sh make_debs.sh
RUN dpkg -i /opt/nxlog-ce_2.8.1248_amd64.deb
RUN apt-get purge -y -q xmlto dblatex
RUN apt-get autoremove -y -q

EXPOSE 5999/tcp 5999/udp
VOLUME ["/etc/nxlog"]

ENTRYPOINT ["/usr/bin/nxlog"]
CMD ["-f"]
