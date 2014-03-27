#!/bin/bash
# Makes necessary dirs and puts the dotfiles in place.

cp Xdefaults ~/.Xdefaults
cp Xmodmap ~/.Xmodmap
cp screenrc ~/.screenrc
cp tmux.conf ~/.tmux.conf
cp gitconfig ~/.gitconfig

mkdir -p ~/.config/fish/
cp config.fish ~/.config/fish/config.fish

mkdir -p ~/.vim/colors/
cp molokai.vim ~/.vim/colors/
cp vimrc ~/.vimrc


mkdir -p ~/.i3/
cp i3/* ~/.i3/

mkdir -p ~/.fonts/
cp -R powerline-fonts/ ~/.fonts/
fc-cache -vf ~/.fonts/

git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
