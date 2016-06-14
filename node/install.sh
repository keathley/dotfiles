#!/bin/sh

if ! asdf plugin-list | grep node > /dev/null
then
  echo "  Installing node asdf plugin"
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

if ! [ -e ~/.asdf/installs/nodejs/6.2.1/bin/node ]
then
  echo "  Installing node for you."
  asdf install nodejs 6.2.1
fi

if test ! $(which vtop)
then
  echo "  Installing vtop."
  npm install -g vtop
fi
