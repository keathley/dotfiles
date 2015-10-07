#!/bin/sh

if test ! $(which go)
then
  echo "  Installing go for you."
  brew install go
fi

