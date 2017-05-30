function fish_prompt
  echo (current_user) "in" (directory_name) (git_info)
  echo (prompt_char)" "
end

function version
  if test -e mix.exs
    set_color 62A
    echo -n (elixir_version)
    set_color normal
  else if test -e package.json
    set_color yellow
    echo -n (node_version)
    set_color normal
  else if test -e Gemfile
    set_color red
    echo -n (node_version)
    set_color normal
  else
    echo -n ""
  end
end

function ruby_version
  echo (asdf which ruby)
end

function node_version
  echo (asdf which nodejs)
end

function elixir_version
  echo (asdf which elixir)
end

function git_info
  set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree --short HEAD ^/dev/null)
  test -n "$repo_info"; or return
  set -l pristine (command git status --porcelain)
  set -l unpushed (command git cherry -v @\{upstream\} ^/dev/null)
  echo -n "on "
  if test "$pristine" = ""
    set_color green
    git_prompt_info
    set_color normal
  else
    set_color red
    git_prompt_info
    set_color normal
  end

  if test "$unpushed" = ""
    echo -n ""
  else
    echo "is"
    set_color magenta
    echo -n "unpushed"
    set_color normal
  end
end

function git_prompt_info
  git symbolic-ref --quiet --short HEAD; or git show --oneline -s | awk '{print $1}'
end

function current_user
  set_color magenta
  echo -n $USER
  set_color normal
end

function directory_name
  set_color green
  echo -n (prompt_pwd)
  # echo -n (basename $PWD)
  set_color normal
end

function prompt_char
  # git branch >/dev/null ^/dev/null; and echo '[±]'; and return
  # echo '○'
  echo 'λ'
end
