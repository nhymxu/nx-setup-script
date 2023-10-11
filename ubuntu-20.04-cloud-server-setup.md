# Ubuntu 20.04 server setup

Hosted on Vultr

### Setup locale and timezone
```shell
timedatectl set-timezone Asia/Ho_Chi_Minh
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales
```

### Installing build essentials
```shell
apt install build-essential libssl-dev
apt install git xclip vim curl fonts-powerline gnupg2 ca-certificates unzip z sqlite3
apt install apt-transport-https gnupg-agent software-properties-common
apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

### Install nginx

http://nginx.org/en/linux_packages.html#Ubuntu

```shell
systemctl enable nginx
systemctl start nginx
```

Other extra config for nginx
- https://github.com/ergin/nginx-cloudflare-real-ip
- https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/MANUAL-CONFIGURATION.md


### Setup PHP repo
```shell
add-apt-repository ppa:ondrej/php
apt-get update
```

### Install PHP 7.4
```shell
apt install php7.4-fpm php7.4-bcmath php7.4-bz2 php7.4-cli php7.4-curl php7.4-gd php7.4-gmp php7.4-imagick php7.4-imap php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-pgsql php7.4-redis php7.4-sqlite3 php7.4-tidy php7.4-xml php7.4-zip php7.4-xsl
usermod -aG www-data nginx
```

### Install PHP 8.2
```shell
apt install php8.2-fpm php8.2-bcmath php8.2-bz2 php8.2-cli php8.2-curl php8.2-gd php8.2-gmp php8.2-imagick php8.2-imap php8.2-intl php8.2-mbstring php8.2-mysql php8.2-pgsql php8.2-redis php8.2-sqlite3 php8.2-tidy php8.2-xml php8.2-zip php8.2-xsl
```

Tweak setup

```ini
date.timezone = 'Asia/Ho_Chi_Minh'
```

### Install MariaDB 10.4
```shell
apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
echo "deb [arch=amd64,arm64,ppc64el] http://ftp.yz.yamagata-u.ac.jp/pub/dbms/mariadb/repo/10.4/ubuntu focal main" | tee /etc/apt/sources.list.d/mariadb.list
apt update
apt install mariadb-server
systemctl enable mariadb
systemctl start mariadb
```

### Install PostgreSQL 12
```shell
sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update
apt-get install postgresql-12
```

### Install pyenv & python 3.8.3

https://github.com/pyenv/pyenv-installer#installation--update--uninstallation

```shell
pyenv install 3.8.3
```


### System tweak
```shell
echo "net.core.somaxconn=65536" >> /etc/sysctl.conf

# Limit size of journald log
#  Force log rotate: systemctl kill --kill-who=main --signal=SIGUSR2 systemd-journald.service
echo SystemMaxUse=500M | sudo tee -a /etc/systemd/journald.conf
```

### Backup & Restore PostgreSQL

Switch to postgres user

```shell
su - postgres
```

Backup
```shell
pg_dump --no-owner --no-acl --no-privileges --verbose -Ft -d truyen247vn -f /remote_fs/truyen247_2020-09-22_1400.tar
```

Restore
```shell
pg_restore --no-owner --no-acl --no-privileges --verbose --username=postgres --dbname=truyen247vn /remote_fs/truyen247_2020-09-22_1400.tar
```

Change owner (if needed)
```shell
for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" truyen247vn` ; do  psql -c "alter table \"$tbl\" owner to truyen247vn" truyen247vn ; done

for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" truyen247vn` ; do  psql -c "alter sequence \"$tbl\" owner to truyen247vn" truyen247vn ; done

for tbl in `psql -qAt -c "select table_name from information_schema.views where table_schema = 'public';" truyen247vn` ; do  psql -c "alter view \"$tbl\" owner to truyen247vn" truyen247vn ; done
```
