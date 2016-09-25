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
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

if [ ! -d "$HOME/$dir" ]; then
  fancy_echo "Cloning dotfiles..."
  git clone git://github.com/keathley/dotfiles.git ~/dotfiles
fi

# Run all of the install files
for file in $(find . -name "install.sh"); do
  sh -c "${file}"
done

case "$SHELL" in
  */fish : ;;
  *)
    fancy_echo "Changing your shell to fish..."
      chsh -s "$(which fish)"
    ;;
esac

fancy_echo "Setting MacOs defaults..."
./osx/set-defaults.sh

# Install homebrew
# Install asdf
# Clone dotfiles repo
# Run Brew install
# Run symlinks
# Install mac defaults
# Run any custom installs (check to see if we need to move these around)
# Run vundle install

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks
# for file in $(find . -name "*.symlink"); do
#   local filename=${file##*/}

#   # echo "Moving existing dotfile $filename from ~ to $olddir"
#   if [ -f ~/.${filename%.*} ]
#   then
#     mv ~/.${filename%.*} ~/dotfiles_old/${filename%.*}-$(date '+%FT%T')
#   fi

#   echo "Creating symlink to $file in home directory."
#   ln -shf $dir/${file#'./'} ~/.${filename%.*}
# done

