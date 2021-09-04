#编译服务
# source ../.env

docker-compose pull \
    && docker-compose --env-file ../.env up -d --build
