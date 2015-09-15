#!/bin/sh

if test ! $(brew list | grep git)
then
  echo "  Installing git for you."
  brew install git > /tmp/git-install.log
fi

