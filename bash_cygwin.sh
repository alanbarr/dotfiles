################################################################################
# Taken from:
# https://www.electricmonk.nl/log/2012/04/24/re-use-existing-ssh-agent-cygwin-et-al/
# If no SSH agent is already running, start one now.
# Re-use sockets so we never have to start more than one session.
export SSH_AUTH_SOCK=/home/${USER}/.ssh-socket
ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
   # No ssh-agent running
   rm -rf $SSH_AUTH_SOCK
   # >| allows output redirection to over-write files if no clobber is set
   ssh-agent -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
   source /tmp/.ssh-script
   echo $SSH_AGENT_PID >| ~/.ssh-agent-pid
   rm /tmp/.ssh-script
   # User specific - prompt to add key first time agent is started
   # ssh-add <path-to-key>
   ssh-add ~/.ssh/id_rsa
fi
################################################################################
export DISPLAY=:0.0
