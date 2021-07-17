#!/bin/bash
curpwd=$(pwd)
git pull

declare -A sysdict=(
    ["0"]="blog"
    ["1"]="identity"
		["2"]="nginx"
  )

echo -e "\033[33m all support system: \033[0m"
for key in $(echo ${!sysdict[*]})
  do
    echo -e "\033[31m $key --> ${sysdict[$key]} \033[0m" 
  done

echo -e "\033[33m please input your number\033[0m"
read MYSYS
case $MYSYS in
0) #博客系统
    cd scripts/blog
	sh run.sh
	break 
	;; 													
1) #身份认证系统
	cd scripts/identity
	sh run.sh
	break
	;;
2) #Nginx
	cd nginx
	docker-compose up -d --build 
	break
	;;
*)
	echo "Invalid input."
	;;
esac

docker system prune -f