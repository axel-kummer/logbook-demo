#!/usr/bin/env bash
cd $( dirname "${BASH_SOURCE[0]}" )

set -ex

cd ..

composer install --ignore-platform-reqs

docker-compose down -v
docker-compose pull
docker-compose build
docker-compose up -d

./import-db.sh