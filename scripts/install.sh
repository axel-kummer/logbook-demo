#!/usr/bin/env bash
cd $( dirname "${BASH_SOURCE[0]}" )

set -ex

cd ..

composer install --ignore-platform-reqs

docker-compose down -v
docker-compose pull
docker-compose build
docker-compose up -d

sleep 30
if [[ ${OS} == "Windows_NT" ]]; then
    winpty docker-compose exec db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /var/data/database-dump.sql'
else
    docker-compose exec db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /var/data/database-dump.sql'
fi