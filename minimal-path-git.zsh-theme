source $(dirname $0)/modules/minimal.zsh
source $(dirname $0)/modules/path.zsh
source $(dirname $0)/modules/git.zsh

PROMPT='$(prompt_minimal) '
RPROMPT='$(prompt_path)$(prompt_git)'
