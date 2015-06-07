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

