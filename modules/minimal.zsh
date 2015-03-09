autoload -U colors && colors

PROMPT_CHAR="❯"

function prompt_minimal() {
  #just some shorthands
  local rs="%{$reset_color%}"
  local green="%{$fg[green]%}"
  local red="%{$fg[red]%}"

  local user_privilege="%(!.$green.$rs)$PROMPT_CHAR$rs"
  local bg_job="%(1j.$green.$rs)$PROMPT_CHAR$rs"
  local cmd_status="%(0?.$green.$red)$PROMPT_CHAR$rs"
  local suffix=" "

  echo "$user_privilege$bg_job$cmd_status$suffix"
}
