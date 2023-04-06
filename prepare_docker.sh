#!/bin/bash -x

docker-compose down
# docker-compose build --force-rm
xhost +local:root
BUILDKIT_PROGRESS=plain docker-compose up --build --force-recreate --remove-orphans -d