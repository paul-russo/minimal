function git_branch_name() {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  [[ -n $branch_name ]] && echo " $branch_name"
}

function git_is_dirty() {
  if [[ -n "$(git status --porcelain 2> /dev/null | tail -n1)" ]]; then
    echo "%{$fg[red]%}"
  else
    echo "%{$fg[green]%}"
  fi
}

function prompt_git() {
  local infos="$(git_is_dirty)$(git_branch_name)%{$reset_color%}"
  echo "$infos"
}
