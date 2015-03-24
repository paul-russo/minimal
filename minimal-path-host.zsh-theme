source $(dirname $0)/modules/defaults.zsh
source $(dirname $0)/modules/user.zsh
source $(dirname $0)/modules/jobs.zsh
source $(dirname $0)/modules/status.zsh
source $(dirname $0)/modules/path.zsh
source $(dirname $0)/modules/path.zsh
source $(dirname $0)/modules/host.zsh

PROMPT='$(prompt_user)$(prompt_jobs)$(prompt_status) '
RPROMPT='$(prompt_path) $(prompt_host)'
