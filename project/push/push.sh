#!/bin/bash
source ../.env

declare -a list=()
declare -A dict=(
    ["5002"]="hx.identityserver.api"
    ["5003"]="hx.blog.api"
  )

declare -A dictversion=(
    ["5002"]="1.0.0"
    ["5003"]="5.0.0"
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
echo -e "\033[33m you will be dealing with following services: \033[0m"

for item in ${list[@]}
  do
    if [[ -z ${dict[$item]} ]]
      then
        echo -e "\033[31m $item not exist \033[0m"
    else
      echo "$item --> ${dict[$item]} --> ${dictversion[$item]}"
    fi
  done

#发布服务
function push(){
    echo -e -n "\033[33m please confirm whether to push,y=>yes? \033[0m"
    read INPUT_STRING
    if [ $INPUT_STRING != y ];
    then
        exit 0
    fi

    for item in ${list[@]}
    do
        if [[ -z ${dict[$item]} ]]
        then
            echo -e "\033[31m $item --> ${dict[$item]} \033[0m  not exist"
        else
            docker tag "$DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:latest" "$DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:${dictversion[$item]}"
            
            docker push "$DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:${dictversion[$item]}"
            docker push "$DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:latest"
        fi
    done
}

push