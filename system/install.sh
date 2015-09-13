#!/bin/sh

if test ! $(which ag)
then
  echo "  Installing Silver Searcher."
  brew install the_silver_searcher > /tmp/ag-install.log
fi

