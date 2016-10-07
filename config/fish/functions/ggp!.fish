function ggp! -d 'Force push a branch to a git repo'
  git push --force-with-lease $argv
end
