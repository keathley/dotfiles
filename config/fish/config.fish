source ~/.asdf/asdf.fish
source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
# source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# eval (opam config env)

if test -e ~/.localenv
  source ~/.localenv
end

set -e fish_greeting

# set -g fish_color_autosuggestion 555 yellow
# set -g fish_color_command 5f87d7
# set -g fish_color_comment 808080
# set -g fish_color_cwd 87af5f
# set -g fish_color_cwd_root 5f0000
# set -g fish_color_error 870000 --bold
# set -g fish_color_escape af5f5f
# set -g fish_color_history_current 87afd7
# set -g fish_color_host 5f87af
# set -g fish_color_match d7d7d7 --background=303030
# set -g fish_color_normal normal
# set -g fish_color_operator d7d7d7
# set -g fish_color_param 5f87af
# set -g fish_color_quote d7af5f
# set -g fish_color_redirection normal
# set -g fish_color_search_match --background=purple
# set -g fish_color_status 5f0000
# set -g fish_color_user 5f875f
# set -g fish_color_valid_path --underline
#
# set -g fish_color_dimmed 555
# set -g fish_color_separator 999
#
# set -g fish_pager_color_completion normal
# set -g fish_pager_color_description 555 yellow
# set -g fish_pager_color_prefix cyan
# set -g fish_pager_color_progress cyan

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# export EDITOR="atom"
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
export ERL_AFLAGS="-kernel shell_history enabled"
