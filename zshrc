# Created by promptline.vim which utilizes vim-airline on monokai theme
source ~/.promptline.sh
ZLE_RPROMPT_INDENT=0

# Some essentials
export EDITOR=vim
export SHELL=zsh
export TERM=xterm-256color # Because apparently 'rxvt-unicode-256color' is either "too long" or "unknown terminal type".
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # removed '/' from the list; ctrl-w on ls foo/bar/baz only removes baz

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
unsetopt AUTO_MENU

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
    alias la="ls -halF --color=auto"

    # ls after cd
    chpwd() ls -CF --color=auto

    # "irkki", old habits die slow...
    alias irkki="tmux attach -d"

    # rekey; reloading the keymaps and xmodmaps of my liking after (re)plugging a keyboard
    alias rekey="setxkbmap -layout fi -option caps:escape,compose:menu,nbsp:none; xmodmap -e 'keycode 134 = Super_R'"

    # reload backround - necessary after xrandr things
    alias redraw="sh ~/.xrandr; feh --bg-fill ~/git/dotfiles/not-just-a-soldier.jpg"

    # alt-s to insert sudo in beginning of line
    insert_sudo () { zle beginning-of-line; zle -U "sudo " }
    zle -N insert-sudo insert_sudo
    bindkey "^[s" insert-sudo

    # A nice alias to run updates on the machine
    alias updates="sudo apt update; sudo apt full-upgrade;"

    # sudo apt-get install
    alias sagi="sudo apt-get install"

### end aliases
