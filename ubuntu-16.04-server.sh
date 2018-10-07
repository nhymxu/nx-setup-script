### Setup locale
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

### Python
sudo apt install python-pip
sudo pip install virtualenv
sudo apt install supervisor

### Nginx mainline
wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx
deb-src [ arch=amd64,arm64 ] http://nginx.org/packages/mainline/ubuntu/ xenial nginx" | sudo tee /etc/apt/sources.list.d/nginx.list



### MariaDB 10.3
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
# sudo add-apt-repository 'deb [arch=amd64,arm64,i386,ppc64el] https://mirrors.shu.edu.cn/mariadb/repo/10.3/ubuntu xenial main'

echo "deb [arch=i386,ppc64el,arm64,amd64] https://mirrors.shu.edu.cn/mariadb/repo/10.3/ubuntu xenial main
# deb-src [arch=i386,ppc64el,arm64,amd64] https://mirrors.shu.edu.cn/mariadb/repo/10.3/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/mariadb.list



### PHP
sudo add-apt-repository ppa:ondrej/php



sudo apt update
sudo apt install nginx mariadb-server
sudo apt install php7.2-fpm php7.2-bcmath php7.2-bz2 php7.2-cli php7.2-curl php7.2-gd php7.2-imap php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-pgsql php7.2-redis php7.2-sqlite3 php7.2-xml php7.2-zip php7.2-xsl



sudo systemctl enable nginx
sudo systemctl enable mariadb
sudo systemctl start nginx
sudo systemctl start mariadb


### Redis
#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04


sudo usermod -aG www-data nginx


### Cerbot let's encrypt
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx 


### MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start


### S3CMD
sudo apt-get install python-setuptools
sudo apt install zip
wget https://github.com/s3tools/s3cmd/releases/download/v2.0.2/s3cmd-2.0.2.zip
unzip s3cmd-2.0.2.zip
cd s3cmd-2.0.2
sudo python setup.py install
rm -rf s3cmd-2.0.2.zip
sudo rm -rf s3cmd-2.0.2
# s3cmd --configure

### Bat - alternative for cat
wget https://github.com/sharkdp/bat/releases/download/v0.6.1/bat_0.6.1_amd64.deb
sudo dpkg -i bat_0.6.1_amd64.deb
rm -rf bat_0.6.1_amd64.deb
