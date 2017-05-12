#!/bin/sh

PROJ_ROOT=$(cd $(dirname $0)/..; pwd)

echo "Running docker images..."
cd $PROJ_ROOT/docker && docker-compose start
