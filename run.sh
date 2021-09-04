#!/bin/bash
curpwd=$(pwd)
git pull

declare -A sysdict=(
    ["0"]="project"
		["1"]="nginx"
		["2"]="jenkins"
		["3"]="elk"
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
    cd scripts
	sh run.sh
	break 
	;; 													
1) #Nginx
	cd nginx
	sh run.sh
	break
	;;
2) #jenkins
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