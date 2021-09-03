#!/bin/bash

docker-compose up --build -d --force-recreate
docker system prune -f