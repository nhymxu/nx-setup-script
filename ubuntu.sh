#!/bin/bash
# Dz's Development Machine Setup on Ubuntu
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#
# set software sources to server for united states
#
# For other software:
## VLC from software center
## virtual box from software center
## PDF Mod from software center
## shutter from software center
## kazam from software center
## install unity tweak tool from software center
## install rebar: pull from github (for building erlang applications)
## Learn from https://github.com/rafaelstz/simplesh
## Learn from https://github.com/sojharo/mangi-script/blob/master/my_ubuntu_setup.sh
## Learn from https://gist.github.com/beaorn/7b90a21b7e80e7744d8d2d08e49efcee

sudo apt-get update

# Installing build essentials
sudo apt-get install -y build-essential libssl-dev

sudo apt install zsh git xclip vim curl fonts-powerline
# chsh -s $(which zsh)
chsh -s `which zsh`

git config --global user.name "Dung Nguyen"
git config --global user.email "contact@dungnt.net"

# Python
sudo apt install python python-dev python-pip python3 python3-dev python3-pip
# Pip package
pip3 install --user pipenv pyenv

# Tilix terminal emulator
sudo apt install tilix
ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Archive Extractors
sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

# FileZilla - a FTP client
sudo apt-get install -y filezilla

# Screen capture
sudo apt install -y flameshot

# Erlang - Actor Concurrency Model based Programming Language
# sudo apt-get install -y erlang

# Elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
rm -rf erlang-solutions_1.0_all.deb
sudo apt-get install esl-erlang
sudo apt-get install elixir

sudo apt-get install silversearcher-ag

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker nhymxu

# Docker-compose
sudo pip install docker-compose

# Nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install input method
sudo apt install fcitx fcitx-unikey
im-config -n fcitx

# Nodejs package
sudo npm install -g npm
sudo npm install -g yo grunt-cli @angular/cli gulp-cli

# Java SDK
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java10-installer
# echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# echo oracle-java10-installer shared/accepted-oracle-licence-v1-1 boolean true | sudo /usr/bin/debconf-set-selections

sudo apt-get install make binutils bison gcc \
 build-essential git curl zlib1g-dev openssl libssl-dev libreadline-dev \
 libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
 software-properties-common wget dnsutils vim zip unzip screen tmux htop \
 libffi-dev redis-server imagemagick ntp ufw sudo dirmngr libxrender1
sudo apt-get install automake autoconf libreadline-dev libncurses-dev \
libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev \
libwxgtk3.0-dev libgl1-mesa-dev  libglu1-mesa-dev libssh-dev xsltproc fop \
libxml2-utils

# PostgreSQL Database
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main
" >> /etc/apt/sources.list.d/postgresql.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt-get install postgresql-10 libpq-dev
sudo -u postgres psql
postgres=# \password postgres

# LNAV log parser
curl -s https://packagecloud.io/install/repositories/tstack/lnav/script.deb.sh | sudo bash



wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
