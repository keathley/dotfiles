#!/bin/sh

# Unfortunately this is not brew installable yet
if test ! $(which kiex)
then
  echo " Installing kiex for you."
  \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
fi
