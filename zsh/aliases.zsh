#!/usr/bin/false

# LC_COLLATE=C: sort case-sensitive, i.e. README before aaa.py
alias ls='LC_COLLATE=C ls --color --group-directories-first'
alias ll='LC_COLLATE=C ls -la'
alias la='LC_COLLATE=C ls -A'
alias l='LC_COLLATE=C ls -CF'

alias xo='xdg-open'

alias pacman="sudo pacman"

alias history="history 0" # force zsh to show the complete history

# create directory and set it as cwd
alias take=_take
_take() {
    if [ -z "$1" ]; then
        printf 'usage: %s directory' $0 > /dev/stderr
        return 1
    fi

    mkdir -p $1
    cd $1
}

