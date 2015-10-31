#!/bin/sh

if test ! $(which elixir)
then
  echo "  Installing elixir for you."
  brew install elixir > /tmp/elixir-install.log
fi

if test ! $(which kiex)
then
  echo " Installing kiex for you."
  \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
fi

