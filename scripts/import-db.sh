sleep 30
if [[ ${OS} == "Windows_NT" ]]; then
    winpty docker-compose exec db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /var/data/database-dump.sql'
else
    docker-compose exec db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /var/data/database-dump.sql'
fi