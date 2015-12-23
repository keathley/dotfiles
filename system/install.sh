#!/bin/sh

if test ! $(which postgres)
then
  echo "  Setting up postgres"
  createuser -s postgres
fi
