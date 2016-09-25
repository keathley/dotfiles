#!/bin/sh

#######################################################
# bootstrap.sh
# This script sets up a laptop the way that I like it.
#######################################################

set -e

dir=~/dotfiles
olddir=~/dotfiles_old

fancy_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

install_latest() {
  if ! [ -d "~/.asdf/installs/$1" ]
  then
    fancy_echo "Installing $1..."
    asdf list-all $1 | head -1 | xargs asdf install $1
  fi
}

if [ ! -d "$HOME/$olddir" ]; then
  fancy_echo "Creating $olddir for backup of any existing dotfiles"
  mkdir "$HOME/$olddir"
fi

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap homebrew/bundle
fi

fancy_echo "Updating Homebrew..."
brew update
brew bundle

if ! command asdf; then
  fancy_echo "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

if [ ! -d "$HOME/$dir" ]; then
  fancy_echo "Cloning dotfiles..."
  git clone git://github.com/keathley/dotfiles.git ~/dotfiles
fi

fancy_echo "Setting MacOs defaults..."
./osx/set-defaults.sh

fancy_echo "Linking dotfiles..."
env RCRC=$HOME/dotfiles/rcrc rcup

if ! [ -e ~/.vim/bundle/Vundle.vim ]
then
  fancy_echo "Installing vundler..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

if ! asdf plugin-list | grep elixir > /dev/null
then
  fancy_echo "Installing elixir asdf plugin..."
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

if ! asdf plugin-list | grep node > /dev/null
then
  fancy_echo "Installing node asdf plugin..."
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

if ! asdf plugin-list | grep ruby > /dev/null
then
  fancy_echo "Installing ruby asdf plugin..."
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

if ! asdf plugin-list | grep elm > /dev/null
then
  fancy_echo "Installing elm asdf plugin..."
  asdf plugin-add elm https://github.com/obmarg/asdf-elm.git
fi

install_latest("elixir")
install_latest("nodejs")
install_latest("ruby")
install_latest("elm")

if test ! $(which vtop)
then
  fancy_echo "Installing vtop..."
  npm install -g vtop
fi

if [[ ! $(psql -U postgres -c '\du' | grep 'postgres') ]]
then
  fancy_echo "Setting up postgres"
  createuser -s postgres
fi

case "$SHELL" in
  */fish : ;;
  *)
    fancy_echo "Changing your shell to fish..."
      chsh -s "$(which fish)"
    ;;
esac
