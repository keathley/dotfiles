#!/bin/sh

if ! asdf plugin-list | grep elixir > /dev/null
then
  echo "  Installing elixir asdf plugin"
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

if ! [ -e ~/.asdf/installs/elixir/1.2.6/bin/elixir ]
then
  echo "  Installing elixir for you."
  asdf install elixir 1.2.6
  asdf install elixir 1.3.0-rc.1
fi
