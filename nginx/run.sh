#!/bin/bash
curpwd=$(pwd)
cd ..
git pull
cd $curpwd

git pull
docker-compose --env-file ../.env up --build -d --force-recreate
docker-compose -f docker-compose.yml up --build -d --force-recreate

docker system prune -f