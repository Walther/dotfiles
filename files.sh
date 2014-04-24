#!/bin/bash
# Makes necessary dirs, clones things from github, and puts the dotfiles in place.

# Various essentials
cp Xdefaults ~/.Xdefaults
cp Xmodmap ~/.Xmodmap
cp screenrc ~/.screenrc
cp tmux.conf ~/.tmux.conf
cp gitconfig ~/.gitconfig

# Vim
mkdir -p /tmp/vim-molokai
git clone https://github.com/tomasr/molokai /tmp/vim-molokai
mkdir -p ~/.vim/colors/
cp /tmp/vim-molokai/colors/molokai.vim ~/.vim/colors/
cp vimrc ~/.vimrc

git clone https://github.com/bling/vim-airline /tmp/vim-airline;
cp -R /tmp/vim-airline/doc /tmp/vim-airline/plugin /tmp/vim-airline/t /tmp/vim-airline/autoload ~/.vim/
mkdir -p ~/.i3/
cp i3.conf ~/.i3/config
cp i3status.conf ~/.i3/

# Fonts
mkdir -p ~/.fonts/
mkdir -p /tmp/powerline-fonts
git clone https://github.com/Lokaltog/powerline-fonts /tmp/powerline-fonts
cp -R /tmp/powerline-fonts/ ~/.fonts/
fc-cache -vf ~/.fonts/

# Shell
mkdir -p ~/.config/fish/
cp config.fish ~/.config/fish/config.fish
git clone https://github.com/bpinto/oh-my-fish ~/.oh-my-fish;
cd ~/.oh-my-fish; git pull; cd ~; # hacky way to make sure it's up to date
