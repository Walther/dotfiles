#!/bin/bash
# My preferred software + some customizations. Requires sudo.

sudo apt-get update;
sudo apt-get install cmatrix feh ghc git htop i3 i3-wm iotop lightdm nethogs nmap rxvt-unicode-256color scrot tmux tree vim-nox xclip xcompmgr xsel zsh;

# update dmenu to use the xft version. Sidenote, why wasn't this feature merged but put as an alternative?
sudo update-alternatives --set dmenu /usr/bin/dmenu.xft;

mkdir -p /tmp/urxvt-perls
git clone https://github.com/muennich/urxvt-perls /tmp/urxvt-perls
sudo cp /tmp/urxvt-perls/clipboard /usr/lib/urxvt/perl/

mkdir -p ~/Downloads
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

