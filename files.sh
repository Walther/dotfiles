#!/bin/bash
# Makes necessary dirs, clones things from github, and puts the dotfiles in place.

# Various essentials
cp Xdefaults ~/.Xdefaults
cp screenrc ~/.screenrc
cp tmux.conf ~/.tmux.conf
cp gitconfig ~/.gitconfig

# Vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/edkolev/tmuxline.vim ~/.vim/bundle/tmuxline.vim
git clone https://github.com/edkolev/promptline.vim ~/.vim/bundle/promptline.vim

mkdir -p /tmp/vim-molokai
git clone https://github.com/tomasr/molokai /tmp/vim-molokai
mkdir -p ~/.vim/colors/
cp /tmp/vim-molokai/colors/molokai.vim ~/.vim/colors/
cp vimrc ~/.vimrc

# i3 window manager
mkdir -p ~/.i3/
cp i3.conf ~/.i3/config

# Fonts
mkdir -p ~/.fonts/
mkdir -p /tmp/powerline-fonts
git clone https://github.com/Lokaltog/powerline-fonts /tmp/powerline-fonts
cp -R /tmp/powerline-fonts/ ~/.fonts/
fc-cache -vf ~/.fonts/

# Shell
cp zshrc ~/.zshrc
cp shell_prompt.sh ~/.shell_prompt.sh
