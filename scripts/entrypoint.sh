#!/bin/sh

export PGPASSWORD=$(awk '/password/ {print $2}' config/database.yml | cut -d'"' -f 2)
set -x
DATABASE=$(psql -lqt -h localhost -U postgres | awk '/consul/ {print $1}')
if [ -z $DATABASE ]; then
  bin/rake db:create
  bin/rake db:migrate
  bin/rake db:dev_seed
fi
$@

