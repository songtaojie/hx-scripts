#!/bin/bash

curpwd=$(pwd)
cd ..
git pull
cd $curpwd

source ./.env
docker-compose -f docker-compose.yaml up --build -d --force-recreate
docker system prune -f