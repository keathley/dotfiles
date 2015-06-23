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

alias gco='git checkout'
alias gb='git branch'
alias gst='git status'
alias gs='git status -sb'
alias gd='git diff'
alias ggp='git push origin $(current_branch)'
alias ggl='git pull origin $(current_branch)'
alias gaa='git add -A'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
