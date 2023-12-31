#!/bin/bash

curpwd=$(pwd)
cd ..
git pull
cd $curpwd

source ./.env
docker-compose up --build -d --force-recreate
docker system prune -f