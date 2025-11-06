
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

precmd() {
    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"
	print ""
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' formats '(%s %b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%s %b%u%c %a)'
zstyle ':vcs_info:*:*' actionformats '(%s %b)'

setopt prompt_subst
setopt print_exit_value


# ternary example: "%(?.A.B)"
# (here ? is the previous return)

PROMPT='%F{240} [%T] %~ ${vcs_info_msg_0_}
$%f '
RPROMPT=""
