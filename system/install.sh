#!/bin/sh

if test ! $(which ag)
then
  echo "  Installing Silver Searcher."
  brew install the_silver_searcher > /tmp/ag-install.log
fi

if test ! $(which hub)
then
  echo "  Installing Hub."
  brew install hub > /tmp/hub-install.log
fi

if test ! $(which selecta)
then
  echo "  Installing Selecta."
  brew install selecta > /tmp/selecta-install.log
fi

if test ! $(which postgres)
then
  echo "  Installing Postgres."
  brew install postgresql > /tmp/postgres-install.log
  createuser -s postgres
fi
