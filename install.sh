#!/bin/bash
# My preferred software + some customizations. Requires sudo.

sudo apt-get update;
sudo apt-get install fish ghc git htop i3 i3-wm i3status lightdm nmap python-pip rxvt-unicode-256color tmux vim vim-nox;

sudo cp urxvt-perls/clipboard /usr/lib/urxvt/perl/

pip install --user git+git://github.com/Lokaltog/powerline

mkdir -p ~/Downloads
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

