autoload -U colors && colors

setopt prompt_subst

PROMPT_CHAR="❯"

ON_COLOR="%{$fg[green]%}"
OFF_COLOR="%{$reset_color%}"
ERR_COLOR="%{$fg[red]%}"

function prompt_user() {
  echo "%(!.$ON_COLOR.$OFF_COLOR)$PROMPT_CHAR%{$reset_color%}"
}

function prompt_jobs() {
  echo "%(1j.$ON_COLOR.$OFF_COLOR)$PROMPT_CHAR%{$reset_color%}"
}

function prompt_status() {
  echo "%(0?.$ON_COLOR.$ERR_COLOR)$PROMPT_CHAR%{$reset_color%}"
}

function -prompt_ellipse(){
  local string=$1
  local sep="$rsc..$path_color"
  if [[ $MINIMAL_SHORTEN == true ]] && [[ ${#string} -gt 10 ]]; then
    echo "${string:0:4}$sep${string: -4}"
  else
    echo $string
  fi
}

function prompt_path() {
  local path_color="%{[38;5;244m%}%}"
  local rsc="%{$reset_color%}"
  local sep="$rsc/$path_color"

  echo "$path_color$(print -P %2~ | sed s_/_${sep}_g)$rsc"
}

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status) '
RPROMPT='$(prompt_path)'
