function gco -d 'Checkout a git branch' --wraps 'git checkout'
  git checkout $argv
end

# complete -f --command gco -a '(__fish_git_branches)' --description 'Branch'
