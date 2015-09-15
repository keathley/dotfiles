#!/bin/sh

if test ! $(brew list | grep tmux)
then
  echo "  Installing tmux for you."
  brew install tmux > /tmp/tmux-install.log
fi

