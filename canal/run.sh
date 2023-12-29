#!/bin/bash
curpwd=$(pwd)
cd ..

cd $curpwd

declare -A optdict=(
    ["0"]="build"
    ["1"]="push"
	["2"]="pull"
  )

echo -e "\033[33m all support operate: \033[0m"
for key in $(echo ${!optdict[*]})
  do
    echo -e "\033[31m $key --> ${optdict[$key]} \033[0m" 
  done

echo -e "\033[33m please input your number\033[0m"
read MYINPUT
case $MYINPUT in
0) #编译服务
    cd build
	sh build.sh
	break 
	;; 													
1) #发布镜像
	cd push
	sh push.sh
	break
	;;
2) #Nginx
	cd pull
	sh pull.sh
	break
	;;
*)
	echo "Invalid input."
	;;
esac

docker system prune -f