#!/bin/bash

source ./.env
echo "开始构建ELK，版本号：$ELK_VERSION"
docker-compose up --build -d --force-recreate
