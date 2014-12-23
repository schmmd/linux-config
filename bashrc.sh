#!/bin/bash

# Check for an interactive session
[ -z "$PS1" ] && return

# make a TAB variable globally accessible
export TAB=`echo -e "\t"`

# sort compares binary data
export LC_ALL=C

function notify {
    eval "$*"
    if [ $? -eq 0 ]
    then
      notify-send -t 300000 -u critical "'$*' succeeded"
    else
      notify-send -t 300000 -u critical "'$*' failed"
    fi
}

function add {
    awk '{ sum+=$1 } END { print sum }'
}

alias fn='find -name'

# Amazon EC2
EC2_KEYS="$HOME/keys/aws-dev-keypair.pem"
alias ec2ssh='ssh -i "$EC2_KEYS" -l ec2-user'
alias ec2scp='scp -i "$EC2_KEYS" -o "User ec2-user"'

export HISTSIZE=10000
export HISTIGNORE="ls:exit:[bf]g"

# import functions and aliases in bash subfolder
for f in $HOME/config/bash/*; do source $f; done

# append commands to the history file, rather than overwritingp
shopt -s histappend

# save each command right when it is executed, not at the end of the session
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export PS1="[\u@\h \W]\$(__git_ps1)\$ "

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
