function prompt_path() {
  local path_color="%{[38;5;244m%}%}"
  local rsc="%{$reset_color%}"
  local wd="$(print -P %2~)"
  local sep="$rsc/$path_color"

  # echo "$path_color${wd//\//$sep}$rsc"
  echo "$path_color%2~%{$reset_color%}"
}
