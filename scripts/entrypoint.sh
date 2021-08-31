#!/bin/sh -x
bin/rake db:create
bin/rake db:migrate
bin/rake db:dev_seed
$@

