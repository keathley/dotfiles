function gco -d 'Checkout a git branch'
  git checkout $argv
end

complete -f --command gco -a '(__fish_git_branches)' --description 'Branch'

function __fish_git_branches
    # In some cases, git can end up on no branch - e.g. with a detached head
    # This will result in output like `* (no branch)` or a localized `* (HEAD detached at SHA)`
    # The first `string match -v` filters it out because it's not useful as a branch argument
    command git branch --no-color -a $argv ^/dev/null | string match -v '\* (*)' | string match -r -v ' -> ' | string trim -c "* " | string replace -r "^remotes/" ""
end
