stty -ixon

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
# ZSH_THEME="keathley"
# ZSH_THEME="k2"
ZSH_THEME="dstufft"

unsetopt nomatch

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(git bundler sublime)


export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# My Path shit
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Node modules
export PATH="./node_modules/.bin:$PATH"

# Go
export GOPATH=$HOME/Development/gocode
export PATH=$PATH:$GOPATH/bin

# Xiki
export PATH=$PATH:/Users/chris/Development/xiki/bin

# Cabal
export PATH=$HOME/.cabal/bin:$PATH

source $ZSH/oh-my-zsh.sh

# Aliases
alias e="subl"
alias migrate="be rake db:migrate"
alias rollback="be rake db:rollback"
alias testprep="be rake db:test:prepare"
alias sandbox="rails c --sandbox"
alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"
alias p="cd ~/Development/"
alias gaa="git add -A"
alias tea="tc start 3 --growl --beep"

# Move these to git
alias ggpush='git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

