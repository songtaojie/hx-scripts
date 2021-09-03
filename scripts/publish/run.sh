curpwd=$(pwd)
git pull
cd /home/songtaojie/git/blog-admin
git pull
cd /home/songtaojie/git/blog-client
git pull
cd $curpwd

source ./.env
# docker login --username=$DOCKER_REGISTRY_USERNAME --password=$DOCKER_REGISTRY_PASSWORD $DOCKER_REGISTRY
# docker login --username=$DOCKER_REGISTRY_USERNAME $DOCKER_REGISTRY

echo "1 Pull Services"
echo -e "10 Push Images to aliyun- \e[33mWarning\e[0m:this operation will replace the docker images on Ali Docker Images of Prod."

#编译服务
function pull(){
    docker-compose pull \
    && docker-compose up -d --build
}

while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
        pull
		break 
		;; 													
    10)
	 	sh push.sh
	 	break
	 	;;
	 *)
		echo "Invalid input."
		;;
  esac
done

docker system prune -fa