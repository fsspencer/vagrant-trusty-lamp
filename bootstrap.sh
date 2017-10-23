#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php 2> /dev/null
apt-get update 2> /dev/null

apt-get install -y php5.6 php7.0 php-pear 2> /dev/null
apt-get install -y php5.6-dev php5.6-gd php5.6-curl php5.6-mcrypt php5.6-dom php5.6-intl php5.6-mbstring php5.6-zip php5.6-soap php5.6-mysql 2> /dev/null
apt-get install -y php7.0-dev php7.0-gd php7.0-curl php7.0-mcrypt php7.0-dom php7.0-intl php7.0-mbstring php7.0-zip php7.0-soap php7.0-mysql 2> /dev/null
apt-get install -y php7.1-dev php7.1-gd php7.1-curl php7.1-mcrypt php7.1-dom php7.1-intl php7.1-mbstring php7.1-zip php7.1-soap php7.1-mysql 2> /dev/null
apt-get install -y libapache2-mod-php7.0 2> /dev/null
a2dismod php5.6
a2dismod php7.1
a2enmod php7.0

export DEBIAN_FRONTEND="noninteractive"
# # Import MySQL 5.7 Key
# # gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 5072E1F5
echo "deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7" | tee -a /etc/apt/sources.list.d/mysql.list
apt-get update

debconf-set-selections <<< "mysql-community-server mysql-community-server/data-dir select ''"
debconf-set-selections <<< 'mysql-server mysql-server/root_password password ${configs[configs][general][mysql_root_pwd]}'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password ${configs[configs][general][mysql_root_pwd]}'

apt-get install -y mysql-server 2> /dev/null

apt-get install -y apache2 2> /dev/null
apt-get install -y openssl 2> /dev/null
a2enmod rewrite 2> /dev/null

APACHEUSR=`grep -c 'APACHE_RUN_USER=www-data' /etc/apache2/envvars`
APACHEGRP=`grep -c 'APACHE_RUN_GROUP=www-data' /etc/apache2/envvars`
if [ APACHEUSR ]; then
    sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
fi
if [ APACHEGRP ]; then
    sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars
fi
chown -R vagrant:www-data /var/lock/apache2


# if /var/www is not a symlink then create the symlink and set up apache
if [ ! -h /var/www ];
then
	cd /home/vagrant
    ln -fs /var/www sites
    a2enmod rewrite 2> /dev/null
    sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default
    service apache2 restart 2> /dev/null
fi

# restart apache
service apache2 reload 2> /dev/null

# copy addwebsite command
cp /scripts/addwebsite /usr/local/bin/addwebsite 2> /dev/null
chmod +x /usr/local/bin/addwebsite 2> /dev/null
cp /scripts/phpswitch /usr/local/bin/phpswitch 2> /dev/null
chmod +x /usr/local/bin/phpswitch 2> /dev/null
cp /scripts/adddb /usr/local/bin/adddb 2> /dev/null
chmod +x /usr/local/bin/adddb 2> /dev/null
cp /etc/vagrant/apache2/skeleton /etc/apache2/sites-available/skeleton 2> /dev/null

mkdir -p /var/www/html
echo "<?php phpinfo();" > /var/www/

apt-get install -y git 2> /dev/null


