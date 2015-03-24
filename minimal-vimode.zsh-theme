source $(dirname $0)/modules/defaults.zsh
source $(dirname $0)/modules/user.zsh
source $(dirname $0)/modules/jobs.zsh
source $(dirname $0)/modules/status.zsh
source $(dirname $0)/modules/vimode.zsh

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_vimode)$(prompt_status) '
