#!/usr/bin/env zsh
############################
# install.sh
# This script creates symlinks from the home directory to any
# desired dotfiles in ~/dotfiles
############################

set -e

dir=~/dotfiles
olddir=~/dotfiles_old

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks
for file in $(find . -name "*.symlink"); do
  local filename=${file##*/}

  echo "Moving existing dotfile $filename from ~ to $olddir"
  if [ -f ~/.${filename%.*} ]
  then
    mv -v ~/.${filename%.*} ~/dotfiles_old/${filename%.*}-$(date '+%FT%T')
  fi

  echo "Creating symlink to $file in home directory."
  ln -shf $dir/${file#'./'} ~/.${filename%.*}
done
