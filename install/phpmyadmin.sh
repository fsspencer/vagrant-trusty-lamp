#!/usr/bin/env bash

debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password ${configs[configs][general][mysql_root_pwd]}"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password ${configs[configs][general][mysql_root_pwd]}"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password ${configs[configs][general][mysql_root_pwd]}"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
apt-get -y install phpmyadmin  2> /dev/null