FROM ubuntu:14.04
MAINTAINER Cloudesire team <dev@cloudesire.com>

ADD make.sh make.sh
RUN /make.sh

EXPOSE 5999/tcp 5999/udp
VOLUME ["/etc/nxlog"]

ENTRYPOINT ["/usr/bin/nxlog"]
CMD ["-f"]
