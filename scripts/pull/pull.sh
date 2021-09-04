
#编译服务
function pull(){
    docker-compose pull \
    && docker-compose up -d --build
}

 pull