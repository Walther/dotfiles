# Walther's .zshrc

# Created by promptline.vim which utilizes vim-airline on monokai theme
source ~/.shell_prompt.sh
ZLE_RPROMPT_INDENT=0

# Some essentials
EDITOR=vim

# Aliases <3
alias ls=ls -CF --color=auto
alias ll=ls -halF --color=auto

# ls after cd
chpwd() ls -CF --color=auto
