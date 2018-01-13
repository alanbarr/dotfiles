################################################################################
# History
################################################################################
HISTCONTROL=
HISTSIZE=2000
HISTFILESIZE=200000
HISTTIMEFORMAT="(%F %T) "
# Append history to file rather than overwrite
shopt -s histappend
# Save and reload history after each command
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# Save history after each command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

################################################################################
# Misc
################################################################################

