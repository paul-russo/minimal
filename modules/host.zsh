function prompt_host(){
  local host_prefix=" %{$FG[244]%}"
  local host_name="$host_prefix%m%{$reset_color%}"

  echo "$host_prefix$host_name"
}
