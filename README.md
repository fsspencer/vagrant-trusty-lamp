Vagrant Ubuntu trusty LAMP
===================


This is a simple vagrant box which ideally to work with web based projects with frameworks like Magento, Laravel, Symfony, Wordpress, etc.

----------


Install
-------------

Clone the repository on you local machine and execute "vagrant up" to begin.

> **Requirements:**

> - VirtualBox
> - Vagrant

----------

Specifications
-------------

> **Specs:**

> - Apache 2.4
> - MySQL 5.7
> - PHP 5.6
> - PHP 7.0
> - PHP 7.1
> - PhpMyAdmin
> - XDebug
> - Composer
> - Redis
> - Memcached
> - NodeJS
> - Gulp
> - Grunt
> - Postfix / Mailutils
> - ElasticSearch


----------

Configuration
-------------

Before starting, you need to copy etc/config.yaml.sample to etc/config.yaml and set your preferences.
There you can set the Memory you want to allocate to the box, mysql root's password and which modules you want to install.

> **IMPORTANT:** You wont be able to initiate the box without creating the config.yaml file.

----------

Start a Project
-------------

First step is initiate your vagrant box

    $ git clone https://github.com/fsspencer/vagrant-trusty-lamp

	$ vagrant up
Once your vagrant box is up and running,  login via SSH to it.

	$ vagrant ssh 
Assuming that your project would be called "local.codealist.net", first step will be create the virtual host using the script we provide

	$ sudo addwebsite local.codealist.net 
Then we should create a database for it with a specific mysql username/password

	$ sudo adddb codealist mypassword 
Our box uses by default PHP 7.0, but in case you want to change it, you can do it like this

	$ sudo phpswitch 5.6 
And that would do the trick.

----------
PHP Command Line usage
----------
As we mentioned before, this box has 3 different PHP versions

    $ php -v
    PHP 7.1.10-1+ubuntu14.04.1+deb.sury.org+1 (cli) (built: Sep 29 2017 17:33:22) ( NTS ) Copyright (c) 1997-2017 The PHP Group Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies with Zend OPcache v7.1.10-1+ubuntu14.04.1+deb.sury.org+1, Copyright (c) 1999-2017, by Zend Technologies
    
    $ php7.0 -v
    PHP 7.0.24-1+ubuntu14.04.1+deb.sury.org+1 (cli) (built: Sep 28 2017 16:33:02) ( NTS ) Copyright (c) 1997-2017 The PHP Group Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies with Zend OPcache v7.0.24-1+ubuntu14.04.1+deb.sury.org+1, Copyright (c) 1999-2017, by Zend Technologies
    
    $ php 5.6 -v
    PHP 5.6.31-6+ubuntu14.04.1+deb.sury.org+1 (cli) Copyright (c) 1997-2016 The PHP Group Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
  
