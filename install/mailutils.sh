#!/usr/bin/env bash

DEBIAN_FRONTEND=noninteractive apt-get -y install mailutils
sed -i "s/^relayhost.*/relayhost = ${SMTP_RELAY}/g" /etc/postfix/main.cf
service postfix restart
update-rc.d postfix defaults

service apache2 reload