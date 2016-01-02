#!/bin/sh

if ! [ -e ~/.rubies/ruby-2.2.2/bin/ruby ]
then
  echo "  Installing ruby for you."
  ruby-install ruby
fi
