ARG DOCKER_REGISTRY
ARG DOCKER_REGISTRY_NAMESPACE
ARG NGINX_VERSION

FROM ${DOCKER_REGISTRY}/${DOCKER_REGISTRY_NAMESPACE}/nginx:${NGINX_VERSION}
COPY ./DockerConfig/nginx.conf /etc/nginx/nginx.conf
COPY ./DockerConfig/certfile/server.crt /etc/nginx/ssl/server.crt
COPY ./DockerConfig/certfile/server.key /etc/nginx/ssl/server.key
COPY ./DockerConfig/configs/blog /etc/nginx/conf.d/
# COPY configs/identity /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf