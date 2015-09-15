#!/bin/sh

if test ! $(which node)
then
  echo "  Installing node."
  brew install node > /tmp/node-install.log
fi

if test ! $(which n)
then
  echo "  Installing n."
  npm install -g n

  n latest
  n latest
fi

if test ! $(which vtop)
then
  echo "  Installing vtop."
  npm install -g vtop
fi

