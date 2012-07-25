# Aliases
alias ls='ls -FG'
alias l='ls -A'
alias ll='ls -Al'

alias r='rails'
alias b='bundle exec'

alias ..="cd .."
alias h="cd ~"
alias c="clear"

alias m="mvim"
alias o="open"

alias p="pygmentize -f terminal -g"

alias subsys='ssh kimjoar@server2.subsys.no'
alias slice='ssh -p 30000 kim@67.23.12.65'
alias es='ssh -p 1411 kimjoar@es.chrismas.no'

alias s='open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

type hub &>/dev/null && alias git=hub

# Exports
export GREP_OPTIONS="--color=auto"
export CLICOLOR=1
export EDITOR="mvim"

export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/Cellar/python/2.7.1/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

# Functions
ps1_git() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

ps1_rvm() {
  branch=$(git symbolic-ref -q HEAD 2>/dev/null) || return 0
  if [ -n "${branch}" ]
    then command -v rvm-prompt >/dev/null 2>&1 && printf ":%s" "$(rvm-prompt) "
  fi
}

# Custom promt
PS1="\[\e[1;32m\]\w\[\e[0;31m\]\$(ps1_git)\[\e[1;36m\]\$(ps1_rvm)\n\[\e[0m›\] "
PS2="\[\e[0m›\] "

# Completions
[[ -s "$HOME/.bash/git-completion" ]] && . "$HOME/.bash/git-completion"

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load Amazon keys
[[ -f "$HOME/.amazon_keys" ]] && . "$HOME/.amazon_keys";
