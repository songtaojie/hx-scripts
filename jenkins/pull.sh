#编译服务
docker-compose pull \
    && docker-compose up -d --build

docker system prune -fa