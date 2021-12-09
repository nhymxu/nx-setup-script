# pc-setup-script
Setup script for macOS/Ubuntu PC/Laptop

#### Mount remote folder using `sshfs`
```
sshfs -o allow_other,default_permissions,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 user@192.168.0.1:/data/web /data/web
```
