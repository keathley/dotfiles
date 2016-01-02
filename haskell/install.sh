#!/bin/sh

if test ! $(which ghc-mod)
then
  echo " Installing ghc-mod for you."
  stack install ghc-mod cabal-helper
fi
