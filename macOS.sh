#!/bin/bash
# Dz's Development Machine Setup on macOS
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#


# Homebrew package manage
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Dnsmasq - simple local dns for development
brew install dnsmasq
sudo brew services start dnsmasq
