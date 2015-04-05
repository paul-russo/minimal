autoload -U colors && colors

setopt prompt_subst

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

PROMPT_CHAR=${PROMPT_CHAR:-"❯"}

ACCENT_COLOR=${ACCENT_COLOR:-"$fg[green]"}
ERROR_COLOR=${ERROR_COLOR:-"$fg[red]"}
NORMAL_COLOR=${NORMAL_COLOR:-"$reset_color"}

PATH_COLOR=${PATH_COLOR:-"$FG[244]"}
HOST_COLOR=${HOST_COLOR:-"$FG[244]"}

AHEAD_COLOR=${AHEAD_COLOR:-"$NORMAL_COLOR"}
BEHIND_COLOR=${BEHIND_COLOR:-"$FG[208]"}
DIVERGED_COLOR=${DIVERGED_COLOR:-"$ERROR_COLOR"}

function prompt_user() {
  echo "%(!.%{$ACCENT_COLOR%}.%{$NORMAL_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_jobs() {
  echo "%(1j.%{$ACCENT_COLOR%}.%{$NORMAL_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

function prompt_status() {
  echo "%(0?.%{$ACCENT_COLOR%}.%{$ERROR_COLOR%})$PROMPT_CHAR%{$reset_color%}"
}

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status) '

