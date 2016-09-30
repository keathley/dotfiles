function delete_commit --description 'Delete a sha from a git repo'
  git rebase -p --onto $argv[1]\^ $argv[1]
end

