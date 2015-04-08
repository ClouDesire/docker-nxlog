#!/bin/bash

apt-get -y update
apt-get install -y -q wget debhelper automake libapr1-dev libpcre3-dev  libssl-dev libdbi-dev libcap-dev libexpat1-dev libtool libperl-dev autotools-dev xmlto dblatex 
wget -q -O - http://softlayer-dal.dl.sourceforge.net/project/nxlog-ce/nxlog-ce-2.8.1248.tar.gz | tar -xzf - -C /opt
cd /opt/nxlog-ce-2.8.1248/packaging/debian

sh make_debs.sh

dpkg -i /opt/nxlog-ce_2.8.1248_amd64.deb

apt-get purge -y -q xmlto dblatex

apt-get autoremove -y -q

rm -rf /opt/nxlog-ce-2.8.1248
