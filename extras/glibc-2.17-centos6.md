# Fix error "/lib64/libc.so.6: version `GLIBC_2.14' not found" on Centos 6

## Centos 6 - 64bit

```shell
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-2.17-55.el6.x86_64.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-common-2.17-55.el6.x86_64.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-devel-2.17-55.el6.x86_64.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-headers-2.17-55.el6.x86_64.rpm

sudo rpm -Uvh glibc-2.17-55.el6.x86_64.rpm \
glibc-common-2.17-55.el6.x86_64.rpm \
glibc-devel-2.17-55.el6.x86_64.rpm \
glibc-headers-2.17-55.el6.x86_64.rpm --force --nodeps
```

Mirror

```shell
wget https://vpssim.com/script/vpssim/Softwear/glibc_2.17/glibc-2.17-55.el6.x86_64.rpm
wget https://vpssim.com/script/vpssim/Softwear/glibc_2.17/glibc-common-2.17-55.el6.x86_64.rpm
wget https://vpssim.com/script/vpssim/Softwear/glibc_2.17/glibc-devel-2.17-55.el6.x86_64.rpm
wget https://vpssim.com/script/vpssim/Softwear/glibc_2.17/glibc-headers-2.17-55.el6.x86_64.rpm
sudo rpm -Uvh glibc-2.17-55.el6.x86_64.rpm \
glibc-common-2.17-55.el6.x86_64.rpm \
glibc-devel-2.17-55.el6.x86_64.rpm \
glibc-headers-2.17-55.el6.x86_64.rpm --force --nodeps
```

## Centos 6 - 32bit

```shell
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-i386/glibc-2.17-55.fc20/glibc-2.17-55.el6.i686.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-i386/glibc-2.17-55.fc20/glibc-common-2.17-55.el6.i686.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-i386/glibc-2.17-55.fc20/glibc-devel-2.17-55.el6.i686.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-i386/glibc-2.17-55.fc20/glibc-headers-2.17-55.el6.i686.rpm

sudo rpm -Uvh glibc-2.17-55.el6.i686.rpm \
glibc-common-2.17-55.el6.i686.rpm \
glibc-devel-2.17-55.el6.i686.rpm \
glibc-headers-2.17-55.el6.i686.rpm --force --nodeps
```