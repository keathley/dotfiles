autoload -U colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '[±]' && return
  hg root >/dev/null 2>/dev/null && echo 'Hg' && return
  echo '○'
}

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " is %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

ruby_version() {
  echo "$(ruby --version | awk '{print $2}')"
}

node_version() {
  echo "$(node --version)"
}

elixir_version() {
  echo "$(kiex list | grep = | head -1 | awk '{print $2}')"
}

version_prompt() {
  if [[ -e "mix.exs" ]]
  then
    echo "%{$fg_bold[magenta]%}$(elixir_version)%{$reset_color%} "
  elif [[ -e "package.json" && ! ( -e "Gemfile" ) ]]
  then
    echo "%{$fg_bold[yellow]%}$(node_version)%{$reset_color%} "
  elif ! [[ ( -z "$(ruby_version)" ) ]]
  then
    echo "%{$fg_bold[red]%}$(ruby_version)%{$reset_color%} "
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg_bold[green]%}%1/%\/%{$reset_color%}"
}

current_user() {
  echo "%{$fg[magenta]%}%n%{$reset_color%}"
}

export PROMPT=$'
$(current_user) at $(version_prompt)in $(directory_name) $(git_dirty)$(need_push)\n$(prompt_char) '

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
