#!/bin/bash

source ./.env
echo "版本号$NGINX_VERSION"
docker-compose up --build -d --force-recreate
