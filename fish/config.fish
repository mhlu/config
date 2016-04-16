set -x PIP_REQUIRE_VIRTUALENV true
set -x GOPATH $HOME/Workspace/go
set -x PATH $GOPATH/bin $PATH
set -x PATH /usr/local/bin /usr/local/sbin $PATH

set -x EDITOR vim

alias ...='cd ../..'
alias ....='cd ../../..'

alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

alias v='vim'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

alias dm='docker-machine'
alias d='docker'
alias ds='docker-machine start; and docker-machine env; and eval (docker-machine env)'
