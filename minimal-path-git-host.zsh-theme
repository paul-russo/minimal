source $(dirname $0)/modules/minimal.zsh
source $(dirname $0)/modules/path.zsh
source $(dirname $0)/modules/git.zsh
source $(dirname $0)/modules/host.zsh

PROMPT='$(prompt_minimal)'
RPROMPT='$(prompt_path)$(prompt_git)$(prompt_host)'
