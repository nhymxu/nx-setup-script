#!/bin/bash
# Dz's Development Machine Setup on macOS
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#

#-------------------------------
# Tweak
#---------------

# Move Screenshots to folder
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots


# Homebrew package manage
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



# Dnsmasq - simple local dns for development
brew install dnsmasq
echo -e '# Customize by nhymxu\nconf-dir=/usr/local/etc/dnsmasq.d/,*.conf' >> $(brew --prefix)/etc/dnsmasq.conf
sudo mkdir -v /etc/resolver

sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/test'
echo 'address=/test/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.d/test.conf

sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
