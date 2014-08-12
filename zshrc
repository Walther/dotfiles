# Walther's .zshrc

# Created by promptline.vim which utilizes vim-airline on monokai theme
source ~/.shell_prompt.sh
ZLE_RPROMPT_INDENT=0

# Some essentials
export EDITOR=vim
export SHELL=zsh

# Grrrrr.
setopt NO_BEEP

# Ctrl-arrows are better than alt-b and whatever.
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

# easier, better tabcomplete
setopt COMPLETE_IN_WORD
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 3 numeric
setopt BASH_AUTO_LIST
unset AUTO_MENU

### Borrowed from http://matt.blissett.me.uk/linux/zsh/zshrc
    # Say how long a command took, if it took more than 30 seconds
    export REPORTTIME=30

    # Typing errors...
    alias 'cd..=cd ..'

### end borrowed

### Borrowed from http://stackoverflow.com/a/171564/3709997

    # why would you type 'cd dir' if you could just type 'dir'?
    setopt AUTO_CD

    # Spell check commands!  (Sometimes annoying)
    setopt CORRECT

    # 10 second wait if you do something that will delete everything.  I wish I'd had this before...
    setopt RM_STAR_WAIT

    # Case insensitive globbing
    setopt NO_CASE_GLOB

    # Be Reasonable!
    setopt NUMERIC_GLOB_SORT
    setopt EXTENDED_GLOB

### end borrowed


### Aliases <3
    alias ls="ls -CF --color=auto"
    alias ll="ls -halF --color=auto"

    # ls after cd
    chpwd() ls -CF --color=auto

    # "irkki", old habits die slow...
    alias irkki="tmux attach -d"

    # rekey; reloading the keymaps and xmodmaps of my liking after (re)plugging a keyboard
    alias rekey="setxkbmap -layout fi -option caps:escape,compose:menu,nbsp:none; xmodmap -e 'keycode 134 = Super_R'"

    # alt-s to insert sudo in beginning of line
    insert_sudo () { zle beginning-of-line; zle -U "sudo " }
    zle -N insert-sudo insert_sudo
    bindkey "^[s" insert-sudo

    alias updates="sudo apt-get update; sudo apt-get upgrade; sudo apt-get dist-upgrade;"

### end aliases
