#!/bin/bash
# source ../.env

docker-compose pull \
    && docker-compose --env-file ../.env up -d --build
