PROMPT_CHAR="❯"


function lprompt() {
  local user_privilege="%(!.%{$fg[green]%}.%{$reset_color%})$PROMPT_CHAR"
  local bg_job="%(1j.%{$fg[green]%}.%{$reset_color%})$PROMPT_CHAR"
  local cmd_status="%(0?.%{$fg[green]%}.%{$fg[red]%})$PROMPT_CHAR"
  local suffix="%{$reset_color%} "

  echo "$user_privilege$bg_job$cmd_status$suffix"
}

source ./path.zsh
source ./git.zsh

function rprompt() {
  echo "$(prompt_path)$(prompt_git)"
}

PROMPT='$(lprompt)'
RPROMPT='$(rprompt)'
