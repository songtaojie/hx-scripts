#!/bin/bash

curpwd=$(pwd)
cd ..
git pull
cd $curpwd

docker-compose -f docker-compose.yml up --build -d --force-recreate
docker system prune -f