#!/usr/bin/false

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias pacman="sudo pacman"
alias apt="sudo apt"
alias dnf="sudo dnf"

alias history="history 0" # force zsh to show the complete history

alias docker=_docker
_docker() {
    local args
    args=""

    if [ "$1" = "runx"  ] ; then
        args="run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"
    fi

    docker "$args" "$@"
}

# lazy <source file> -- compiles and runs c/c++ in one go
alias lazy=_lazy
_lazy() {
    local file
    file=$1

    cc $file -o "${file:0:-2}.out" -lm -g3 && gdb -q -ex run ./${file:0:-2}.out
}

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

# compile markdown to html and view in browser
alias m=_m
_m() {
    local file
    local css

    file="$1"
    css="$2"

    if [ -z "$file" ]; then
        file="README.md"
        print "Using $file as file"
    fi

    if [ -z "$css" ]; then
        css="$HOME/air.css"
        print "Using $css as stylesheet"
    fi

    pandoc "$file" -f gfm --css="$css" --self-contained --metadata title="$file" | { chromium-browser "data:text/html;base64,$(base64 -w 0)" &}
}

