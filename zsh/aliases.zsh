function proj() {
  cd $(find ~/Development -maxdepth 1 -type d | selecta)
}

alias reload!='. ~/.zshrc'

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
