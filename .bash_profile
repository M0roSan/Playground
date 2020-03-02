alias ls="ls -GFh"
alias la="ls -a"
alias ll="ls -l"
alias grep="grep --color=auto"

alias upd=". ~/.bash_profile"
alias ebash="code ~/.bash_profile"

# Python setting
alias python=python3
alias pip=pip3

# Go env
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Terminal setting
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[36m\]\h:\[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad