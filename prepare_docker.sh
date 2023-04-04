#!/bin/bash -x

docker-compose down
# docker-compose build --force-rm
docker-compose up --build --force-recreate -d