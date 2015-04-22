function prompt_path() {
  local path_color="%{[38;5;244m%}%}"
  local wd=$(print -P '%2~')
  local sep="%{$reset_color%}/$path_color"

  echo "$path_color${wd//\//$sep}%{$reset_color%}"
}
