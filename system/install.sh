#!/bin/bash

if [[ ! $(psql -U postgres -c '\du' | grep 'postgres') ]]
then
  echo "  Setting up postgres"
  createuser -s postgres
fi
