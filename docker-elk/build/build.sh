#!/bin/bash

source ../.env
echo "��ʼ����ELK���汾�ţ�$ELK_VERSION"
docker-compose --env-file ../.env  up --build  -d --force-recreate
