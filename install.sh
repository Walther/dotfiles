#!/bin/bash
# My dotfiles - essential software, their configs, etc

sudo apt-get update;
sudo apt-get install fish ghc git htop i3 i3-wm i3status lightdm nmap python-pip rxvt-unicode-256color tmux vim vim-gtk xclip;

mkdir -p ~/Downloads
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

pip install --user git+git://github.com/Lokaltog/powerline

cp Xdefaults ~/.Xdefaults
cp Xmodmap ~/.Xmodmap
cp screenrc ~/.screenrc
cp tmux.conf ~/.tmux.conf
cp gitconfig ~/.gitconfig

mkdir -p ~/.config/fish/
cp config.fish ~/.config/fish/config.fish

mkdir -p ~/.vim/colors/
cp vim-monokai/colors/monokai.vim ~/.vim/colors/
cp vimrc ~/.vimrc

sudo cp urxvt-perls/clipboard /usr/lib/urxvt/perl/

mkdir -p ~/.i3/
cp i3/* ~/.i3/

mkdir -p ~/.fonts/
cp -R powerline-fonts/ ~/.fonts/
fc-cache -vf ~/.fonts/

git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
