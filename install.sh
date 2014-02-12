#!/bin/bash
# My commonly used software, in a nice single apt-get install

sudo apt-get update;
sudo apt-get install fish ghc git htop i3 i3-wm i3status lightdm nmap python-pip rxvt-unicode-256color vim xclip;

pip install --user git+git://github.com/Lokaltog/powerline

cp Xdefaults ~/.Xdefaults
cp Xmodmap ~/.Xmodmap
cp screenrc ~/.screenrc
cp tmux.conf ~/.tmux.conf

mkdir -p ~/.config/fish/
cp config.fish ~/.config/fish/config.fish

mkdir -p ~/.vim/colors/
cp vim-monokai/colors/monokai.vim ~/.vim/colors/

mkdir -p ~/.i3/
cp i3/* ~/.i3/

