function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function grep     ; command grep --color=auto $argv ; end

alias i='iex'
alias im='iex -S mix'
alias m='mix'
alias mr='mix run'
alias mt='mix test'
alias mtf='mix test --only focus:true'
alias mps='mix phoenix.server'
alias mdg='mix deps.get'
alias mc='mix compile'


# function checkout_branch_interactive() {
#   git branch | cut -c 3- | selecta | xargs git checkout
# }
#
# function delete_commit() {
#   git rebase -p --onto $1\^ $1
# }

# alias git=hub
# alias g='git'
# alias gco='git checkout'
# alias gb='git branch'
# alias gst='git status'
# alias gs='git status -sb'
# alias gd='git diff'
# alias gdc='git diff --cached'
# alias ggp='git push'
# alias ggp!='git push --force'
# alias ggpu='git push -u origin'
# alias ggl='git pull'
# alias gglr='git pull --rebase'
# alias gaa='git add -A'
# alias gc='git commit -v'
# alias gc!='git commit -v --amend'
# alias gl='git log'
# alias gm='git merge --no-ff'
# alias grm='git rebase master'
# alias gr='git rebase'
# alias gci="checkout_branch_interactive"
# alias gpr="git pull-request -o"
# alias gdc="delete_commit"
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

# alias lsa='ls -lah'
# alias l='ls -lah'
# alias ll='ls -lh'
# alias la='ls -lAh'
#
# alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"
# alias p="cd $PROJECTS"
# alias tea="tc start 3 --growl --beep"
