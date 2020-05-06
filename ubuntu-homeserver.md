# Setup Homeserver with Ubuntu 20.04 on Acer laptop

## Precondition

1. Running as interactive root `sudo -i` so I don't need to type `sudo` before every command.
2. Check the wireless interface name with `ip link` or `ifconfig -a`

## Setup wifi connect

Install require package

```shell
apt install libpcsclite1 wpasupplicant
```

## Create new netplan yaml file

Create file with Vim on `/etc/netplan/01-network-card.yaml`
Some example: `https://netplan.io/examples`

```yaml
network:
    version: 2
    renderer: networkd
    wifis:
        wlp3s0:
            dhcp4: yes
            dhcp6: no
            gateway4: 192.168.1.1
            nameservers:
                addresses: [8.8.8.8]
            access-points:
                "YOUR_AP_NAME":
                   password: "YOUR_AP_PASSWORD"

```

After edit complete, execute below commands:

1. `netplan generate`
2. `netplan apply`

You can turn off and turn on wireless interface by below commands:

1. `ip link set wlp3s0 down`
2. `ip link set wlp3s0 up`

The interface will be turnd on, and router will assign an IP address to the wireless interface, it can be checked with `ifconfig`. When the machine startup, it will automatically connected to the chosen WiFi access point.

## Disable sleep (do nothing) on lid close

```shell
# sudo su
echo 'HandleLidSwitch=ignore' | tee --append /etc/systemd/logind.conf
echo 'HandleLidSwitchDocked=ignore' | tee --append /etc/systemd/logind.conf
sudo service systemd-logind restart
```

## Disable screen on lid close

Install required package

```shell
sudo apt install acpi-support vbetool
```

Config this

```shell
# sudo su
echo 'event=button/lid.*' | tee --append /etc/acpi/events/lm_lid
echo 'action=/etc/acpi/lid.sh' | tee --append /etc/acpi/events/lm_lid
touch /etc/acpi/lid.sh
chmod +x /etc/acpi/lid.sh
```

Edit the /etc/acpi/lid.sh file, paste following content and replace the your_username with your main user name:

```shell
#!/bin/bash

USER=your_username

grep -q close /proc/acpi/button/lid/*/state

if [ $? = 0 ]; then
  # su -c  "sleep 1 && xset -display :0.0 dpms force off" - $USER
  sleep 1 && vbetool dpms off
fi

grep -q open /proc/acpi/button/lid/*/state

if [ $? = 0 ]; then
  # su -c  "xset -display :0 dpms force on &> /tmp/screen.lid" - $USER
  vbetool dpms on
fi
```

Note: Some problem happend with my Acer laptop, so when close lid, screen not off.
Check `cat /proc/acpi/button/lid/LID0/state` alway return open.
So I need turn off my monitor manual.

To turn off monitor in console, the command is the following:

```shell
sudo vbetool dpms off
```

To regain control of the console on pressing Enter key, I suggest

```shell
sudo sh -c 'vbetool dpms off; read ans; vbetool dpms on'
```

After upgrade to Ubuntu 20.04, run vbetool have error

```
○ → sudo vbetool dpms off
mmap /dev/zero: Operation not permitted
Failed to initialise LRMI (Linux Real-Mode Interface).
```

To fix this. Change alias to 

```shell
sudo mount -o remount,exec /dev;sudo vbetool dpms off
```

## Allow current user to edit www-data file/folder

```shell
sudo chown -vR :nhymxu /data/www/
sudo chmod -vR g+w /var/www/
```
