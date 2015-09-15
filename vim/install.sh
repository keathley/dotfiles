#!/bin/sh

if test ! $(brew list | grep vim)
then
  echo "  Installing vim for you."
  brew install vim --with-lua --with-luajit > /tmp/vim-install.log
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

