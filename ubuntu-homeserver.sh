#!/bin/bash

# Dz's Home Server Setup on Ubuntu 19.10
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#

### Setup locale
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

# Installing build essentials
sudo apt install build-essential libssl-dev
sudo apt install git xclip vim curl fonts-powerline gnupg2 ca-certificates unzip 
sudo apt install apt-transport-https gnupg-agent software-properties-common

### Python
sudo apt install python3 python3-dev python3-pip
sudo apt install -y python-is-python3 python-dev-is-python3
sudo pip install virtualenv
sudo pip install apt-select
sudo apt install supervisor

# Alias pip as pip3
sudo ln -s /usr/bin/pip3 /usr/bin/pip


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

## MariaDB - Replace with docker
# sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
# echo "deb [arch=amd64] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/mariadb.list
# sudo apt install mariadb-server

## Install PHP
sudo apt update
sudo apt install nginx apache2-utils
sudo apt install php7.4-fpm php7.4-bcmath php7.4-bz2 php7.4-cli php7.4-curl php7.4-gd php7.4-gmp php7.4-imap php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-pgsql php7.4-redis php7.4-sqlite3 php7.4-tidy php7.4-xml php7.4-zip php7.4-xsl

# Install Nodejs & yn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs yarn

## Other task
sudo usermod -aG www-data nginx
sudo apt install -y sshfs
sudo timedatectl set-timezone Asia/Ho_Chi_Minh

## Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

## Executing the Docker Command Without Sudo (Optional)
sudo usermod -aG docker ${USER}

## Ultilities

### Lazydocker 
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
