#!/bin/sh

if test ! $(which elixir)
then
  echo "  Installing elixir for you."
  brew install elixir > /tmp/elixir-install.log
fi

