#!/bin/sh

if ! [ -e ~/.vim/bundle/Vundle.vim ]
then
  echo "  Installing vundler for you."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi
