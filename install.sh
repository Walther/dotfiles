#!/bin/bash
# My preferred software + some customizations. Requires sudo.

sudo apt-get update;
sudo apt-get install fish ghc git htop i3 i3-wm lightdm nmap rxvt-unicode-256color scrot tmux vim vim-nox xcompmgr;

mkdir -p /tmp/urxvt-perls
git clone https://github.com/muennich/urxvt-perls /tmp/urxvt-perls
sudo cp /tmp/urxvt-perls/clipboard /usr/lib/urxvt/perl/

mkdir -p ~/Downloads
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

