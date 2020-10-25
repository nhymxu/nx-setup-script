# Install latest Monit version

## 1. Installation
Download Precompiled Binaries from https://mmonit.com/monit/#download

```shell
$ tar zxvf monit-x.y.z-linux-x64.tar.gz (x.y.z denotes version numbers)
$ cd monit-x.y.z
$ mkdir -p /etc/monit
$ cp bin/monit /usr/local/bin/
$ cp conf/monitrc /etc/monit/
$ chmod 0700 /etc/monit/monitrc 
$ ln -s /etc/monit/monitrc /etc/monitrc
```

## 2. Add monit service configuration to systemd:

/lib/systemd/system/monit.service

```ini
# This file is systemd template for monit service. To
# register monit with systemd, place the monit.service file
# to the /lib/systemd/system/ directory and then start it
# using systemctl (see below).
#
# Enable monit to start on boot: 
#         systemctl enable monit.service
#
# Start monit immediately: 
#         systemctl start monit.service
#
# Stop monit:
#         systemctl stop monit.service
#
# Status:
#         systemctl status monit.service

[Unit]
Description=Pro-active monitoring utility for unix systems
After=network-online.target
Documentation=man:monit(1) https://mmonit.com/wiki/Monit/HowTo 

[Service]
Type=simple
KillMode=process
ExecStart=/usr/local/bin/monit -I
ExecStop=/usr/local/bin/monit quit
ExecReload=/usr/local/bin/monit reload
Restart = on-abnormal
StandardOutput=null

[Install]
WantedBy=multi-user.target

```

## 3. Enable and start monit:

```shell
systemctl enable monit.service
systemctl start monit.service
```

## 4. Proxying Monit via Nginx

Monit can be used from behind a proxy server.

Here is an example on how to configure Nginx proxy in front of Monit. 
In this example Monit listens on http://192.168.1.10:2812 and we configure Nginx so Monit is accessible via this Nginx proxy URL, http://nginx.addr.ess/monit/

```nginx
    location /monit/ {
        rewrite ^/monit/(.*) /$1 break;
        proxy_ignore_client_abort on;
        proxy_pass   http://192.168.1.10:2812; 
        proxy_redirect  http://192.168.1.10:2812 /monit; 
        proxy_cookie_path / /monit/;
    }
```

## 5. Sending alerts via Gmail

```
  set mailserver smtp.gmail.com port 587
    username "MYUSER" password "MYPASSWORD"
    using tls
```
