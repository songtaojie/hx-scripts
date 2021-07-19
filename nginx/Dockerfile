FROM registry.cn-hangzhou.aliyuncs.com/songtaojie_centos/nginx:1.21.1
COPY nginx.conf /etc/nginx/nginx.conf
COPY certfile/server.crt /etc/nginx/ssl/server.crt
COPY certfile/server.key /etc/nginx/ssl/server.key
COPY configs/blog /etc/nginx/conf.d/
# COPY configs/identity /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf