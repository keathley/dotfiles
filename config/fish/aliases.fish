function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function grep     ; command grep --color=auto $argv ; end

# Try out neovim for a bit
# alias vim='nvim'

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

# Bundler
alias be="bundle exec"
alias bl="bundle list"
alias bu="bundle update"
alias bi="bundle install"

# Renode stuff
alias renode='mono /Applications/Renode.app/Contents/MacOS/bin/Renode.exe'
alias renode-test='/Applications/Renode.app/Contents/MacOS/tests/test.sh'

# alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"
# alias p="cd $PROJECTS"
# alias tea="tc start 3 --growl --beep"
