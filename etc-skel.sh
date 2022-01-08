#!/usr/bin/env bash
set -exuo pipefail

# Intended for use on servers.
# Sets up the /etc/skel directory and adduser.conf for better shell experience for all users

which zsh # Ensure zsh exists on system

sudo cp promptline.sh /etc/skel/.promptline.sh
sudo cp zshrc /etc/skel/.zshrc
sudo sed -i .bu -e "s_DSHELL=/bin/bash_DSHELL=$(which zsh)_" /etc/adduser.conf
