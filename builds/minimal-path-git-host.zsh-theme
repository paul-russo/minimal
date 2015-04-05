autoload -U colors && colors

setopt prompt_subst

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

PROMPT_CHAR=${PROMPT_CHAR:-"❯"}

ACCENT_COLOR=${ACCENT_COLOR:-"$fg[green]"}
ERROR_COLOR=${ERROR_COLOR:-"$fg[red]"}
NORMAL_COLOR=${NORMAL_COLOR:-"$reset_color"}

PATH_COLOR=${PATH_COLOR:-"$FG[244]"}
HOST_COLOR=${HOST_COLOR:-"$FG[244]"}

AHEAD_COLOR=${AHEAD_COLOR:-"$NORMAL_COLOR"}
BEHIND_COLOR=${BEHIND_COLOR:-"$FG[208]"}
DIVERGED_COLOR=${DIVERGED_COLOR:-"$ERROR_COLOR"}

function prompt_user() {
  echo "%(!.%{$ACCENT_COLOR%}.%{$NORMAL_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_jobs() {
  echo "%(1j.%{$ACCENT_COLOR%}.%{$NORMAL_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_status() {
  echo "%(0?.%{$ACCENT_COLOR%}.%{$ERROR_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_path() {
  local working_dir="%{$PATH_COLOR%}%2~%{$reset_color%}"

  echo "$working_dir"
}

function git_branch_name() {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  [[ -n $branch_name ]] && echo "$branch_name"
}

function git_repo_status(){
  local rs="$(git status --porcelain -b)"

  if $(echo "$rs" | grep -v '^##' &> /dev/null); then # is dirty
    echo "%{$ERROR_COLOR%}"
  elif $(echo "$rs" | grep '^## .*diverged' &> /dev/null); then # has diverged
    echo "%{$DIVERGED_COLOR%}"
  elif $(echo "$rs" | grep '^## .*behind' &> /dev/null); then # is behind
    echo "%{$BEHIND_COLOR%}"
  elif $(echo "$rs" | grep '^## .*ahead' &> /dev/null); then # is ahead
    echo "%{$AHEAD_COLOR%}"
  else # is clean
    echo "%{$ACCENT_COLOR%}"
  fi
}

function prompt_git() {
  local bname=$(git_branch_name)
  if [[ -n $bname ]]; then
    local infos="$(git_repo_status)$bname%{$reset_color%}"
    echo " $infos"
  fi
}

function prompt_host(){
  local host_name="%{$HOST_COLOR%}%m%{$reset_color%}"

  echo "$host_name"
}

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status) '
RPROMPT='$(prompt_path)$(prompt_git) $(prompt_host)'

