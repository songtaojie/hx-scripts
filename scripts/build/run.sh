#!/bin/bash

curpwd=$(pwd)
cd /home/songtaojie/git/blog-server
git pull
cd /home/songtaojie/git/blog-identity-server
git pull
cd /home/songtaojie/git/blog-admin
git pull
cd /home/songtaojie/git/blog-client
git pull
cd $curpwd

source ./.env
# docker login --username=$DOCKER_REGISTRY_USERNAME --password=$DOCKER_REGISTRY_PASSWORD $DOCKER_REGISTRY
docker login --username=$DOCKER_REGISTRY_USERNAME $DOCKER_REGISTRY

declare -A dict=(
    ["5002"]="hx.identityserver.api"
    ["5003"]="hx.blog.api"
  )

echo -e "\033[33m all services: \033[0m"
for key in $(echo ${!dict[*]})
  do
    echo -e "\033[31m $key --> ${dict[$key]} \033[0m" 
  done

#接收用户输入数据
inde=0
echo -e "\033[33m please input your service port,and input e to finish: \033[0m"
while read input
  do
    if [ $input == "e" ]
    then
      break
    else
      list[$inde]=$input
      let inde+=1
    fi
  done

#判断输入长度
len=${#list[@]}
if [ $len -le 0 ]
  then
    echo -e "\033[31m your input is empty,and exit shell \033[0m" 
    exit 2
fi

#显示用户要处理的数据列表
echo -e "\033[33m you will be dealing with following services with Version latest: \033[0m"

for item in ${list[@]}
  do
    if [[ -z ${dict[$item]} ]]
      then
        echo -e "\033[31m $item not exist \033[0m" 
    else
      echo "$item --> ${dict[$item]}"
    fi
  done
  
#编译服务
function build(){
    echo -e -n "\033[33m please confirm whether to start processing,y=>yes? \033[0m"
    read confirm
    if [ $confirm == "y" ]
    then
        for port in ${list[@]}
        do
            if [[ -z ${dict[$port]} ]]
            then 
                continue
            else
            docker-compose up --build -d --force-recreate ${dict[$port]}
            fi
        done
        echo -e "\033[32m build finished, good luck \033[0m"
    else
    echo -e "\033[31m you canceled operation \033[0m" 
    fi
}

#重启服务
function up(){
    echo -e -n "\033[33m please confirm whether to start processing,y=>yes? \033[0m"
    read confirm
    if [ $confirm == "y" ]
    then
        for port in ${list[@]}
        do
            if [[ -z ${dict[$port]} ]]
            then 
                continue
            else
            docker-compose up  -d  ${dict[$port]}
            fi
        done
        echo -e "\033[32m up finished, good luck \033[0m"
    else
    echo -e "\033[31m you canceled operation \033[0m" 
    fi
}


echo "1 Build Services"
echo "5 Up Services"

while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
	    build
		break 
		;;
	5)
	    up
		break 
		;;
	*)
		echo "Invalid input."
		;;
  esac
done
