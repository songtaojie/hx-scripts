#!/bin/bash
source ./.env
#发布服务
function push(){
    docker tag $DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:latest $DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:${dictversion[$item]}
            
    docker push $DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:${dictversion[$item]}
    docker push $DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/${dict[$item]}:latest
}

push