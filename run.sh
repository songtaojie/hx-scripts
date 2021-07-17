#!/bin/bash
curpwd=$(pwd)
git pull

declare -a sysdict=( ["0"]="build" ["1"]="pull" ["2"]="push" ["3"]="nginx" )

echo -e "\033[33m all support system: \033[0m"
for key in $(echo ${!sysdict[*]})
  do
    echo -e "\033[31m $key --> ${sysdict[$key]} \033[0m" 
  done

echo -e "\033[33m please input your number\033[0m"
read MYSYS
case $MYSYS in
0) #编译服务
    cd scripts/build
	sh run.sh
	break 
	;; 													
1) #拉去镜像
	cd scripts/pull
	sh run.sh
	break
	;;
2) #Nginx
	cd scripts/push
	sh push.sh
	break
	;;
3) #Nginx
	cd nginx
	docker-compose up -d --build 
	break
	;;
*)
	echo "Invalid input."
	;;
esac

docker system prune -f