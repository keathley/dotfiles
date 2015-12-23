#!/bin/sh

if test ! $(which chruby)
then
  echo "  Installing chruby for you."
  brew install chruby > /tmp/chruby-install.log
fi

if test ! $(which ruby-build)
then
  echo "  Installing ruby-install for you."
  brew install ruby-install > /tmp/ruby-install-install.log
fi
