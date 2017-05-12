#!/bin/sh

PROJ_ROOT=$(cd $(dirname $0)/..; pwd)

echo "Derstroy docker images..."
cd $PROJ_ROOT/docker && docker-compose down
