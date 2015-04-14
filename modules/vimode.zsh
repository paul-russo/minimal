function prompt_vimode(){
  local NMODE="%{$NORMAL_COLOR%}$PROMPT_CHAR%{$reset_color%}"
  local IMODE="%{$ACCENT_COLOR%}$PROMPT_CHAR%{$reset_color%}"
  echo "${${KEYMAP/vicmd/$NMODE}/(main|viins)/$IMODE}"
}

function zle-line-init zle-line-finish zle-keymap-select {
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
