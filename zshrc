### Options

## Own additions

    # Grrrrr.
    setopt NO_BEEP

    # Even as a vim user, emacs mode makes sense in shell
    bindkey -e

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

## End Own additions

## Borrowed from https://gist.github.com/mgattozzi/ccf9cf3cf66aee76a4783277ebc4adbb

    # History
    HISTFILE="$HOME/.zsh_history"
    HISTSIZE=1000000000
    SAVEHIST=1000000000
    # Treat the '!' character specially during expansion.
    setopt BANG_HIST
    # Write the history file in the ":start:elapsed;command" format.
    setopt EXTENDED_HISTORY
    # Write to the history file immediately, not when the shell exits.
    setopt INC_APPEND_HISTORY
    # Share history between all sessions.
    setopt SHARE_HISTORY
    # Expire duplicate entries first when trimming history.
    setopt HIST_EXPIRE_DUPS_FIRST
    # Don't record an entry that was just recorded again.
    setopt HIST_IGNORE_DUPS
    # Delete old recorded entry if new entry is a duplicate.
    setopt HIST_IGNORE_ALL_DUPS
    # Do not display a line previously found.
    setopt HIST_FIND_NO_DUPS
    # Don't record an entry starting with a space.
    setopt HIST_IGNORE_SPACE
    # Don't write duplicate entries in the history file.
    setopt HIST_SAVE_NO_DUPS
    # Remove superfluous blanks before recording entry.
    setopt HIST_REDUCE_BLANKS
    # Don't execute immediately upon history expansion.
    setopt HIST_VERIFY
    # Beep when accessing nonexistent history.
    setopt HIST_BEEP

## Borrowed from http://stackoverflow.com/a/171564/3709997

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

## Borrowed from http://matt.blissett.me.uk/linux/zsh/zshrc
    
    # Say how long a command took, if it took more than 30 seconds
    export REPORTTIME=30

### End Options

### Path & Exports

    function p() {
        export PATH=$PATH:$1
    }

    p ~/.bin
    p ~/.local/bin
    p /usr/local/bin

    export NPM_PACKAGES="${HOME}/.npm-packages"
    export PATH="$NPM_PACKAGES/bin:$PATH"
    source $HOME/.cargo/env

    # UTF-8 goodness
    export LANG="en-US.UTF-8"
    export LANG="en_US.UTF-8"
    export LC_COLLATE="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    export LC_MESSAGES="en_US.UTF-8"
    export LC_MONETARY="en_US.UTF-8"
    export LC_NUMERIC="en_US.UTF-8"
    export LC_TIME="en_US.UTF-8"
    export LC_ALL=

    # Created by promptline.vim which utilizes vim-airline on monokai theme
    source ~/.promptline.sh
    ZLE_RPROMPT_INDENT=0

    # Some essentials
    export EDITOR=nvim
    export SHELL=zsh
    export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # removed '/' from the list; ctrl-w on ls foo/bar/baz only removes baz

### End Path & Exports

### Keys

## Can't remember where this is borrowed from...

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
    # Alt-arrows for mac use
    bindkey '[C' emacs-forward-word
    bindkey '[D' emacs-backward-word

### End Keys

### Functions

    # file count, accepts parameters
    count() { ls -1 "$@" | wc -l }
    
    # ls after cd
    chpwd() ls -F

    # markdown to html5
    function html() {
        pandoc \
            -t html5 \
            -c https://walther.guru/style.css \
            --katex \
            --standalone \
            -o $2 $1
    }

    # markdown to pdf generation
    function pdf() {
        pandoc \
            -t html5 \
            -c https://walther.guru/style.css \
            --standalone \
            --metadata "date:$(date +%F)" \
            --metadata "papersize:a4" \
            --metadata "margin-top:1cm" \
            --metadata "margin-right:1cm" \
            --metadata "margin-bottom:1cm" \
            --metadata "margin-left:1cm" \
            --katex \
            --pdf-engine wkhtmltopdf \
            --pdf-engine-opt "--print-media-type" \
            -o $2 $1
    }


### End Functions

### Aliases

    # ls stuff
    alias ls="exa -F"
    alias ll="exa -halF"

    # Typing errors...
    alias 'cd..=cd ..'

    # "irkki", old habits die slow...
    alias irkki="tmux attach -d"

    # rekey; reloading the keymaps and xmodmaps of my liking after (re)plugging a keyboard
    alias rekey="setxkbmap -layout us -option caps:escape,compose:menu,nbsp:none;"

### end aliases
