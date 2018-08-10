#!/bin/bash
# Dz's Development Machine Setup on macOS
# Author: Dung Nguyen (nhymxu) <contact@dungnt.net>
#

#------------------------------------------------------------------
# Tweak
#------------------------------

# Move Screenshots to folder
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# Fix macOS Sierra ssh-agent issue
cat >> ~/.ssh/config <<EOF
Host *
    IdentityFile ~/.ssh/id_rsa
    AddKeysToAgent yes
EOF

# Keyboard configuration
# Decrease repeat delay, increase repeat rate and disable Emoji.
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g NSUserKeyEquivalents -dict-add 'Emoji & Symbols' '@^j'

# No shadow on window capture (Cmd-S-4 SPC)
defaults write com.apple.screencapture disable-shadow -bool true

# Restart the UI Server service to activate the changes
killall SystemUIServer


#------------------------------------------------------------------
# Software
#------------------------------

# Homebrew package manage
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


#------------------------------------------------------------------
# Dev
#------------------------------

# Dnsmasq - simple local dns for development
brew install dnsmasq
echo -e '# Customize by nhymxu\nconf-dir=/usr/local/etc/dnsmasq.d/,*.conf' >> $(brew --prefix)/etc/dnsmasq.conf
sudo mkdir -v /etc/resolver

sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/test'
echo 'address=/test/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.d/test.conf

sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
