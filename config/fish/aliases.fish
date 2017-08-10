function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function grep     ; command grep --color=auto $argv ; end

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

alias i='iex'
alias im='iex -S mix'
alias m='mix'
alias mr='mix run'
alias mt='mix test'
alias mtf='mix test --only focus:true'
alias mps='mix phoenix.server'
alias mdg='mix deps.get'
alias mc='mix compile'

alias gb='git branch'
alias gs='git status -sb'
alias gdc='git diff --cached'
alias gc!='git commit -v --amend'
alias gl='git log'
alias gpr="git pull-request -o"
alias gcm="git remote show origin | awk '/HEAD branch:/ {print \$3}' | xargs git checkout"

alias migrate="be rake db:migrate"
alias rollback="be rake db:rollback"
alias testprep="be rake db:test:prepare"
alias sandbox="rails c --sandbox"

# Bundler
alias be="bundle exec"
alias bl="bundle list"
alias bu="bundle update"
alias bi="bundle install"

# alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"
# alias p="cd $PROJECTS"
# alias tea="tc start 3 --growl --beep"
