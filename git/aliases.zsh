function current_branch() {
  local ref
  ref=$($_omz_git_git_cmd symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$($_omz_git_git_cmd rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function checkout_branch_interactive() {
  git branch | cut -c 3- | selecta | xargs git checkout
}

function delete_commit() {
  git rebase -p --onto $1\^ $1
}

# eval "$(hub alias -s)"
# This takes ~50ms to run so we just alias it directly
alias git=hub

alias g='git'
alias gco='git checkout'
alias gb='git branch'
alias gst='git status'
alias gs='git status -sb'
alias gd='git diff'
alias gdc='git diff --cached'
alias ggp='git push'
alias ggp!='git push --force'
alias ggpu='git push -u origin'
alias ggl='git pull'
alias gglr='git pull --rebase'
alias gaa='git add -A'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gl='git log'
alias gm='git merge --no-ff'
alias grm='git rebase master'
alias gr='git rebase'
alias gci="checkout_branch_interactive"
alias gpr="git pull-request -o"
alias gdc="delete_commit"
alias gcm="git remote show origin | awk '/HEAD branch:/ {print \$3}' | xargs git checkout"

