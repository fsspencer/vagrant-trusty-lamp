#!/usr/bin/env bash

# install composer
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo composer self-update
