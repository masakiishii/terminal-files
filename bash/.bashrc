# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -G'
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias sl='ls -CFG'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias updatedb='sudo /usr/libexec/locate.updatedb'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
    PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
}
function proml {
    PS1="\[\033[2;36m\]\u\[\033[0m\]@\[\033[0;32m\]\W\[\033[0;35m\]\$(parse_git_branch)\[\033[2;36m\]$\[\033[0m\]"
}
proml

# eval "$(rbenv init -)"
#export EC2_HOME=/usr/local/ec2-api-tools
#export PATH=$PATH:$EC2_HOME/bin
#export EC2_PRIVATE_KEY=~/.ec2/pk-IJWCLWYU5VBP5E2TV4IO6B2FB2RIPSKA.pem
#export EC2_CERT=~/.ec2/cert-IJWCLWYU5VBP5E2TV4IO6B2FB2RIPSKA.pem
#export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com
#export EC2_URL=https://ec2.us-west-2.amazonaws.com


#export JAVA_HOME=/usr/lib/jvm/java-7-oracle
#export AWS_CLOUDWATCH_HOME=/usr/local/CloudWatch
#export AWS_AUTO_SCALING_HOME=/usr/local/AutoScaling
#export AWS_ELB_HOME=/usr/local/ElasticLoadBalancing
#export PATH=$PATH:$AWS_CLOUDWATCH_HOME/bin
#export PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin
#export PATH=$PATH:$AWS_ELB_HOME/bin
#export AWS_CREDENTIAL_FILE=~/credential.txt
#export AWS_CLOUDWATCH_URL=https://monitoring.us-west-2.amazonaws.com
#export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com
#export AWS_CLOUDWATCH_URL=https://monitoring.ap-northeast-1.amazonaws.com
#export AWS_AUTO_SCALING_URL=https://autoscaling.us-west-2.amazonaws.com
#export AWS_AUTO_SCALING_URL=https://autoscaling.ap-northeast-1.amazonaws.com
#export AWS_ELB_URL=https://elasticloadbalancing.us-west-2.amazonaws.com
#export AWS_ELB_URL=https://elasticloadbalancing.ap-northeast-1.amazonaws.com

alias tmux='~/Documents/tmux.sh'

export PATH=$PATH:/sbin

#llvm
#export PATH=$PATH:/usr/local/llvm-3.3/bin
#export PATH=$PATH:/usr/local/llvm-3.3/include


#nvm
source ~/.nvm/nvm.sh
nvm use v0.10.22 &> /dev/null

#ant
ANT_HOME=/usr/bin/apache-ant-1.9.3
PATH=$ANT_HOME/bin:$PATH

#java
export JAVA_HOME=`/usr/libexec/java_home`

#emacs
PATH=/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS:$PATH

#updatedb
alias updatedb='sudo /usr/libexec/locate.updatedb'

#eclipse
PATH=/Applications/eclipse/Eclipse.app/Contents/MacOS:$PATH

#emacs
#alias emacs='emacs &'

#hadoop
export HSTACK_HOME=$HOME/hstack
export HADOOP_VER=2.4.0
export HADOOP_INSTALL=$HSTACK_HOME/hadoop-$HADOOP_VER/
export PATH=$PATH:$HADOOP_INSTALL/bin/

#mysql
export PATH=$PATH:/usr/local/mysql/bin
export CLASSPATH=".:$JAVA_HOME/lib/mysql-connector-java-5.1.32-bin.jar"

#cabal
export PATH=$PATH:$HOME/.cabal/bin
