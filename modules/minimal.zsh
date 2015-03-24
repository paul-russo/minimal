autoload -U colors && colors

setopt prompt_subst

PROMPT_CHAR=${PROMPT_CHAR:-"❯"}
ACCENT_COLOR=${ACCENT_COLOR:-"$fg[green]"}
ERROR_COLOR=${ERROR_COLOR:-"$fg[red]"}
NORMAL_COLOR=${NORMAL_COLOR:-"$reset_color"}
PATH_COLOR=${PATH_COLOR:-"[38;5;244m"}
HOST_COLOR=${HOST_COLOR:-"[38;5;244m"}


function prompt_minimal() {
  #just some shorthands
  local rs="%{$reset_color%}"
  local accent="%{$ACCENT_COLOR%}"
  local error="%{$ERROR_COLOR%}"
  local normal="%{$NORMAL_COLOR%}"


  local user_privilege="%(!.$accent.$normal)$PROMPT_CHAR$rs"
  local bg_job="%(1j.$accent.$normal)$PROMPT_CHAR$rs"
  local cmd_status="%(0?.$accent.$error)$PROMPT_CHAR$rs"

  echo "$user_privilege$bg_job$cmd_status"
}
