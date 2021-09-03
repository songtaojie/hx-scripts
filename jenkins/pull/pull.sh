#编译服务
source ../.env

docker-compose pull \
    && docker-compose up -d --build