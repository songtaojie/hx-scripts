#!/bin/bash
source ../.env

#定义服务
declare -A dict=(
    ["9200"]="elasticsearch"
    ["5000"]="logstash"
    ["5601"]="kibana"
  )
# 定义要发布的服务
declare -a list=("9200" "5000" "5601")
# 定义服务的版本号
declare -A dictversion=(
    ["9200"]=${ELK_VERSION}
    ["5000"]=${ELK_VERSION}
    ["5601"]=${ELK_VERSION}
  )

echo -e "\033[33m all services: \033[0m"
for key in $(echo ${!dict[*]})
  do
    echo -e "\033[31m $key --> ${dict[$key]} \033[0m"
  done

#显示要处理的数据列表
echo -e "\033[33m will be dealing with following services: \033[0m"

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
            docker tag ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:latest ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:${dictversion[$item]}
            
            docker push ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:${dictversion[$item]}
            docker push ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:latest
        fi
    done
}

push
