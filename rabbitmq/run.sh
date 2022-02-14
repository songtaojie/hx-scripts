#!/bin/bash

docker-compose -f docker-compose.yaml up --build -d --force-recreate
docker system prune -f