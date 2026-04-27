source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
# if not contains $_asdf_shims $PATH
#     set -gx --prepend PATH $_asdf_shims
# end
fish_add_path -m -p $_asdf_shims
set --erase _asdf_shims

set fish_greeting ""

# Add private functions for work related things to my functions directory
set fish_function_path \
  $fish_function_path \
  ~/.config/fish/functions/private

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

export EDITOR="nvim"
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_OPTS='--height 30%'
export HOMEBREW_NO_ENV_HINTS=1

if test -e ~/.localenv
  source ~/.localenv
end

if test -e ~/.localenv.fish
  source ~/.localenv.fish
end

export KERL_BUILD_DOCS=yes
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
