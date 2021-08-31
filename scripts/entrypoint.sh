#!/bin/sh -x

export PGPASSWORD=$(awk '/password/ {print $2}' config/database.yml)
DATABASE=$(psql -lqt | awk '/consul/ {print $1}')
if [ -z $DATABASE ]; then
  bin/rake db:create
  bin/rake db:migrate
  bin/rake db:dev_seed
fi
$@

