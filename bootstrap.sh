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
  if [ ! -d "~/.asdf/installs/$1" ]
  then
    fancy_echo "Installing $1..."
    asdf list-all $1 | tail -1 | xargs asdf install $1
  fi
}

# fancy_echo "Setting MacOs defaults..."
# source ~/dotfiles/set-defaults.sh

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap homebrew/bundle
fi

if ! command -v git >/dev/null; then
  brew install git
fi

if [ ! -d "$HOME/.asdf" ]; then
  fancy_echo "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

if [ ! -d "$dir" ]; then
  fancy_echo "Cloning dotfiles..."
  git clone git://github.com/keathley/dotfiles.git ~/dotfiles
fi

fancy_echo "Updating Homebrew..."
brew update
brew bundle --file=$HOME/dotfiles/Brewfile

fancy_echo "Linking dotfiles..."
env RCRC=$HOME/dotfiles/rcrc rcup

. $HOME/.asdf/asdf.sh

if ! asdf plugin-list | grep elixir > /dev/null
then
  fancy_echo "Installing elixir asdf plugin..."
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

if ! asdf plugin-list | grep erlang > /dev/null
then
    fancy_echo "Installing erlang asdf plugin..."
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi

if ! asdf plugin-list | grep ruby > /dev/null
then
  fancy_echo "Installing ruby asdf plugin..."
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

if ! command -v rustup > /dev/null
then
  fancy_echo "Installing rustup..."
  curl https://sh.rustup.rs -sSf | sh
fi

if [[ ! $(psql -U postgres -c '\du' | grep 'postgres') ]]
then
  fancy_echo "Setting up postgres"
  createuser -s postgres
fi

if grep -Fxq "/usr/local/bin/fish" /etc/shells
then
    fancy_echo "Already set up fish shell"
else
    fancy_echo "Adding fish to shell list"
    sudo echo "/usr/local/bin/fish" >> /etc/shells
fi

case "$SHELL" in
  */fish) : ;;
  *)
    fancy_echo "Changing your shell to fish..."
      chsh -s "$(which fish)"
    ;;
esac
