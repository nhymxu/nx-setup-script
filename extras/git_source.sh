#!/usr/bin/env bash
# Install the latest version of git on CentOS 6.x
 
# Install Required Packages
sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
sudo yum install  gcc perl-ExtUtils-MakeMaker
 
# Uninstall old Git RPM
sudo yum remove git
 
# Download and Compile Git Source
cd /usr/src
sudo wget https://www.kernel.org/pub/software/scm/git/git-2.19.1.tar.gz
sudo tar xzf git-2.19.1.tar.gz 
 
cd git-2.19.1
sudo make prefix=/usr/local/git all
sudo make prefix=/usr/local/git install

rm -rf git-2.19.1.tar.gz
rm -rf git-2.19.1

echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
sudo ln -s /usr/local/git/bin/git /usr/bin/git
source /etc/bashrc
 
# Check Git Version
git --version
