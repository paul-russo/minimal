autoload -U colors && colors

setopt prompt_subst

PROMPT_CHAR=${PROMPT_CHAR:-"❯"}
ACCENT_COLOR=${ACCENT_COLOR:-"$fg[green]"}
ERROR_COLOR=${ERROR_COLOR:-"$fg[red]"}
NORMAL_COLOR=${NORMAL_COLOR:-"$reset_color"}
PATH_COLOR=${PATH_COLOR:-"[38;5;244m"}
HOST_COLOR=${HOST_COLOR:-"[38;5;244m"}

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

function git_is_dirty() {
  if [[ -n "$(git status --porcelain 2> /dev/null | tail -n1)" ]]; then
    echo "%{$ERROR_COLOR%}"
  else
    echo "%{$ACCENT_COLOR%}"
  fi
}

function prompt_git() {
  local bname=$(git_branch_name)
  if [[ -n $bname ]]; then
    local infos="$(git_is_dirty)$bname%{$reset_color%}"
    echo " $infos"
  fi
}

function prompt_host(){
  local host_name="%{$HOST_COLOR%}%m%{$reset_color%}"

  echo "$host_name"
}

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status) '
RPROMPT='$(prompt_path)$(prompt_git) $(prompt_host)'

