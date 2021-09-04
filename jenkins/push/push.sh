#!/bin/bash
source ./.env

docker tag  ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/jenkins:latest $DOCKER_REGISTRY/${DOCKER_REGISTRY_NAMESPACE}/jenkins:${JENKINS_VERSION}
            
docker push ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/jenkins:${JENKINS_VERSION}
docker push ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}jenkins:latest