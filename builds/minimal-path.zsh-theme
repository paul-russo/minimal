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

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status) '
RPROMPT='$(prompt_path)'

