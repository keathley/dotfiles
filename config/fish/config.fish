source ~/.asdf/asdf.fish
source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
# source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# eval (opam config env)

if test -e ~/.localenv
  source ~/.localenv
end

set fish_greeting ""

# Add private functions for work related things to my functions directory
set fish_function_path \
  ~/.config/fish/functions/private \
  $fish_function_path

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

export EDITOR="vim"
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_OPTS='--height 30%'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

