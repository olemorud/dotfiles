#!/usr/bin/false

configure_prompt() {
	PROMPT=" 🐢 %F{240}%~
  $%f "
	RPROMPT="%T - %?"
}

precmd() {
    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"
	print ""
}
