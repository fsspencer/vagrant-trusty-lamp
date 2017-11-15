#!/usr/bin/env bash

apt-get -y install php-xdebug

echo 'xdebug.remote_enable = on' >> /etc/php/5.6/cli/conf.d/20-xdebug.ini
echo 'xdebug.remote_connect_back = on' >> /etc/php/5.6/cli/conf.d/20-xdebug.ini
echo 'xdebug.idekey = "vagrant"' >> /etc/php/5.6/cli/conf.d/20-xdebug.ini
echo 'xdebug.max_nesting_level = 200' >> /etc/php/5.6/cli/conf.d/20-xdebug.ini

echo 'xdebug.remote_enable = on' >> /etc/php/7.0/cli/conf.d/20-xdebug.ini
echo 'xdebug.remote_connect_back = on' >> /etc/php/7.0/cli/conf.d/20-xdebug.ini
echo 'xdebug.idekey = "vagrant"' >> /etc/php/7.0/cli/conf.d/20-xdebug.ini
echo 'xdebug.max_nesting_level = 200' >> /etc/php/7.0/cli/conf.d/20-xdebug.ini

echo 'xdebug.remote_enable = on' >> /etc/php/7.1/cli/conf.d/20-xdebug.ini
echo 'xdebug.remote_connect_back = on' >> /etc/php/7.1/cli/conf.d/20-xdebug.ini
echo 'xdebug.idekey = "vagrant"' >> /etc/php/7.1/cli/conf.d/20-xdebug.ini
echo 'xdebug.max_nesting_level = 200' >> /etc/php/7.1/cli/conf.d/20-xdebug.ini

service apache2 restart