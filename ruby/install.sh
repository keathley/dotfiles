#!/bin/sh

# We need to make sure that this is loaded otherwise we can't use chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

if test ! $(chruby | grep 2.2.2)
then
  echo "  Installing ruby for you."
  ruby-install ruby
fi
