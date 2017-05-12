#!/bin/sh

PROJ_ROOT=$(cd $(dirname $0)/..; pwd)

echo "Creating docker images..."
cd $PROJ_ROOT/docker && docker-compose up -d

sleep 5s

echo "Creating Elasticsearch mapping..."
curl -XPUT -d @${PROJ_ROOT}/misc/elasticsearch-mapping.json http://localhost:9200/pinshelf

echo "Creating Database...";
mysql -uroot -proot -h127.0.0.1 -e "CREATE DATABASE pinshelf;"
mysql -uroot -proot -h127.0.0.1 pinshelf < $PROJ_ROOT/misc/mysql-schema.sql

cd $PROJ_ROOT/docker && docker-compose stop

echo "Finished."
