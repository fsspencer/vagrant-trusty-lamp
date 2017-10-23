#!/usr/bin/env bash

apt-get install -y openjdk-7-jre 2> /dev/null
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb 2> /dev/null
dpkg -i elasticsearch-1.7.2.deb 2> /dev/null
update-rc.d elasticsearch defaults 2> /dev/null