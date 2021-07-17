#!/bin/bash
curpwd=$(pwd)
git pull

declare -A sysdict=(
    ["0"]="vocation"
    ["1"]="youlu"
	  ["2"]="nginx&consul"
  )

echo -e "\033[33m all support system: \033[0m"
for key in $(echo ${!sysdict[*]})
  do
    echo -e "\033[31m $key --> ${sysdict[$key]} \033[0m" 
  done

echo -e "\033[33m please input your number\033[0m"
read MYSYS
case $MYSYS in
0) #职考锅巴业务
    cd scripts/vocation
	sh run.sh
	break 
	;; 													
1) #优路财经业务
	cd scripts/youlu
	sh run.sh
	break
	;;
2) #Nginx
	docker-compose up -d --build 
	break
	;;
*)
	echo "Invalid input."
	;;
esac

# sh run.sh
# docker system prune -f