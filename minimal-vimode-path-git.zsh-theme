source $(dirname $0)/modules/defaults.zsh
source $(dirname $0)/modules/user.zsh
source $(dirname $0)/modules/jobs.zsh
source $(dirname $0)/modules/status.zsh
source $(dirname $0)/modules/vimode.zsh
source $(dirname $0)/modules/path.zsh
source $(dirname $0)/modules/git.zsh

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status)$(prompt_vimode) '
RPROMPT='$(prompt_path)$(prompt_git)'
