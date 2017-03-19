function ibase -d 'rebase -i all commits on a branch'
  git rebase -i (git merge-base HEAD master)
end
