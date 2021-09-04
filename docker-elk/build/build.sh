#!/bin/bash

source ../.env

docker-compose up --build -d --force-recreate --env-file ../.env
