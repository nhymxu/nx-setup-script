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
sudo apt install git xclip vim curl fonts-powerline gnupg2 ca-certificates

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
sudo apt update
sudo apt install nginx
