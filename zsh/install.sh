#!/bin/sh

if test ! $(brew list | grep zsh)
then
  echo "  Installing zsh for you."
  brew install zsh > /tmp/zsh-install.log
fi

