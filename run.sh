#!/bin/bash
curpwd=$(pwd)
git pull

declare -A sysdict=(
    ["0"]="build"
    ["1"]="publish"
		["2"]="nginx"
		["3"]="jenkins"
		["4"]="elk"
  )

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
1) #发布镜像
	cd scripts/publish
	sh run.sh
	break
	;;
2) #Nginx
	cd nginx
	sh run.sh
	break
	;;
3) #jenkins
	cd jenkins
	sh run.sh
	break
	;;
3) #elk
	cd docker-elk
	sh run.sh
	break
	;;
*)
	echo "Invalid input."
	;;
esac

docker system prune -f