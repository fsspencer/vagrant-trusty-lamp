#!/usr/bin/env bash

apt-get install -y build-essential nodejs 2> /dev/null
apt-get install -y npm 2> /dev/null
npm -v
npm install -g gulp 2> /dev/null
npm install -g grunt 2> /dev/null
npm install -g grunt-cli 2> /dev/null
