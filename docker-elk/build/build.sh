#!/bin/bash

# source ../.env
docker-compose --env-file ../.env  up --build  -d --force-recreate
