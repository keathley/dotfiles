function ibase -d 'rebase -i all commits on a branch'
  if count $argv > /dev/null
    set base $argv[1]
  else
    set base master
  end

  git rebase -i (git merge-base HEAD $base)
end
