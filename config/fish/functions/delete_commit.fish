function delete_commit
  git rebase -p --onto $argv[1]\^ $argv[1]
end

