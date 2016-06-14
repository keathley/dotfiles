#!/bin/sh

if ! asdf plugin-list | grep ruby > /dev/null
then
  echo "  Installing ruby asdf plugin"
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

if ! [ -e ~/.asdf/installs/ruby/2.3.0/bin/ruby ]
then
  echo "  Installing ruby for you."
  asdf install ruby 2.3.0
fi
