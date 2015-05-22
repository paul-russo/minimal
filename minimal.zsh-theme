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
  local wd="$(print -P %2~)"
  local sep="$rsc/$path_color"
  #local tokens=("${(@s:/:)wd}") won't work because fuck you, that's why
  local tokens; tokens=("${(@s:/:)wd}")
  local rebuilt=""

  local separator=""
  for i in {1..${#tokens}}; do
    rebuilt=$rebuilt$separator$(-prompt_ellipse $tokens[i])
    separator=$sep
  done

  echo "$path_color$rebuilt$rsc"
}

function git_branch_name() {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  [[ -n $branch_name ]] && echo "$branch_name"
}

function git_repo_status(){
  local rs="$(git status --porcelain -b)"

  if $(echo "$rs" | grep -v '^##' &> /dev/null); then # is dirty
    echo "%{$fg[red]%}"
  elif $(echo "$rs" | grep '^## .*diverged' &> /dev/null); then # has diverged
    echo "%{$fg[red]%}"
  elif $(echo "$rs" | grep '^## .*behind' &> /dev/null); then # is behind
    echo "%{[38;5;011m%}%}"
  elif $(echo "$rs" | grep '^## .*ahead' &> /dev/null); then # is ahead
    echo "%{$reset_color%}"
  else # is clean
    echo "%{$fg[green]%}"
  fi
}

function prompt_git() {
  local bname=$(git_branch_name)
  if [[ -n $bname ]]; then
    local infos="$(git_repo_status)$bname%{$reset_color%}"
    echo " $infos"
  fi
}

function prompt_vimode(){
  local ret=""

  case $KEYMAP in
    main|viins)
      ret+="$ON_COLOR"
      ;;
    vicmd)
      ret+="$OFF_COLOR"
      ;;
  esac

  ret+="$PROMPT_CHAR%{$reset_color%}"

  echo "$ret"
}

function zle-line-init zle-line-finish zle-keymap-select {
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_vimode)$(prompt_status) '
RPROMPT='$(prompt_path)$(prompt_git)'

