# Aliases
alias ls='ls -FG'
alias l='ls -a'
alias ll='ls -al'

alias r='rails'
alias b='bundle exec'

alias ..="cd .."
alias h="cd ~"
alias c="clear"

alias m="mvim"
alias o="open"

alias subsys='ssh kimjoar@server2.subsys.no'
alias slice='ssh -p 30000 kim@67.23.12.65'
alias es='ssh -p 1411 kimjoar@es.chrismas.no'

alias startmysql='/usr/local/Cellar/mysql/5.1.47/share/mysql/mysql.server start'
alias stopmysql='/usr/local/Cellar/mysql/5.1.47/share/mysql/mysql.server stop'

# Exports
export GREP_OPTIONS="--color=auto"
export CLICOLOR=1
export EDITOR="mvim"

export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/Cellar/python/2.7.1/bin:$PATH"

# Functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

# Custom promt
PS1="\\e[1;32m\w\\e[0;31m\$(parse_git_branch)\\e[0m › "
PS2="\\e[0m› "

# Completions
[[ -s "$HOME/.bash/git-completion" ]] && . "$HOME/.bash/git-completion"

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
