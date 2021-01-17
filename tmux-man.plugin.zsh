__tmux_man_exists() {
  local page="$1"

  man -w "$page" 1>/dev/null 2>&1
}

__tmux_man() {
  local cmd=( ${=BUFFER} )
  local name="${cmd[1]}"

  if [[ -z "$TMUX" ]]; then
    LBUFFER="man ${name}"
    zle accept-line
    zle -R -c
    return
  fi

  if ! __tmux_man_exists "$name"; then
    tmux display "$(man "$name" 2>&1)"
    return
  fi

  tmux splitw -l '30%' "man $(printf "%q" "$name")"
}

zle -N __tmux_man

bindkey '^[h' __tmux_man
