#!/bin/bash
curpwd=$(pwd)
cd ..
git pull
cd $curpwd

docker-compose --env-file ./.env up --build -d --force-recreate

docker system prune -f