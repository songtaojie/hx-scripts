
#编译服务
docker-compose pull \
    && docker-compose --env-file ../.env  up -d --build