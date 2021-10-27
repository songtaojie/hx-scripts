#!/bin/bash

git pull &&
docker-compose -f docker-compose.yml up --build -d --force-recreate
docker system prune -f