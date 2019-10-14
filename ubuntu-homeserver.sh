#!/bin/bash

# Dz's Home Server Setup on Ubuntu 18.04
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#

### Setup locale
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

# Installing build essentials
sudo apt install build-essential libssl-dev
sudo apt install git xclip vim curl fonts-powerline gnupg2 ca-certificates unzip

### Python
sudo apt install python python-dev python-pip python3 python3-dev python3-pip
sudo pip install virtualenv
sudo pip install apt-select
sudo apt install supervisor

### Temp tracking from sensors
sudo apt install lm-sensors hddtemp
# sudo sensors-detect
# sensors
# sudo hddtemp SATA:/dev/sda

## Nginx web server
echo "deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

## PHP
sudo add-apt-repository ppa:ondrej/php

## MariaDB
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
echo "deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/mariadb.list

## Install 
sudo apt update
sudo apt install nginx apache2-utils
sudo apt install php7.3-fpm php7.3-bcmath php7.3-bz2 php7.3-cli php7.3-curl php7.3-gd php7.3-imap php7.3-intl php7.3-json php7.3-mbstring php7.3-mysql php7.3-pgsql php7.3-redis php7.3-sqlite3 php7.3-xml php7.3-zip php7.3-xsl
sudo apt install mariadb-server

## Other task
sudo usermod -aG www-data nginx
