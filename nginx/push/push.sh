#!/bin/bash
source ../.env

docker tag  ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/hx.proxy.nginx:latest $DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/hx.proxy.nginx:${NGINX_VERSION}
            
docker push ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/hx.proxy.nginx:${NGINX_VERSION}
docker push ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/hx.proxy.nginx:latest