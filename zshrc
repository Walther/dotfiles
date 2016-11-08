# Add some local bin folders to PATH
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Created by promptline.vim which utilizes vim-airline on monokai theme
source ~/.promptline.sh
ZLE_RPROMPT_INDENT=0

# Some essentials
export EDITOR=vim
export SHELL=zsh
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # removed '/' from the list; ctrl-w on ls foo/bar/baz only removes baz

# Grrrrr.
setopt NO_BEEP

# Even as a vim user, emacs mode makes sense in shell
bindkey -e

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish

# Ctrl-arrows are better than alt-b and whatever.
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^[[5D' emacs-backward-word
bindkey '^[[5C' emacs-forward-word


# easier, better tabcomplete
setopt COMPLETE_IN_WORD
zstyle ':completion:*' completer _complete _match _approximate
setopt noautomenu
setopt nomenucomplete
zstyle ':completion:*:approximate:*' max-errors 3 numeric
setopt BASH_AUTO_LIST
unsetopt AUTO_MENU

# git autocomplete
autoload -Uz compinit && compinit

# NPM improvements
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

### Borrowed from http://matt.blissett.me.uk/linux/zsh/zshrc
# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30


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

    # ls stuff
    alias ls="ls -CF --color=auto"
    alias ll="ls -halF --color=auto"
    alias la="ls -halF --color=auto"

    # ls after cd
    chpwd() ls -CF --color=auto

    # Typing errors...
    alias 'cd..=cd ..'

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

    # Fix tmux + irssi screen refresh bug on screens bigger than 40char
    alias irssi='TERM=screen-256color irssi'

    # file count, accepts parameters
    count() { ls -1 "$@" | wc -l }

### end aliases
