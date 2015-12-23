#!/bin/sh
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
