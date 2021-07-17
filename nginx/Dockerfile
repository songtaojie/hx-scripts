FROM registry.cn-hangzhou.aliyuncs.com/songtaojie_centos/nginx:1.21.1
COPY nginx.conf /etc/nginx/nginx.conf
COPY certfile/hx.com.crt /etc/nginx/ssl/hx.com.crt
COPY certfile/hx.com.key /etc/nginx/ssl/hx.com.key
COPY configs/blog /etc/nginx/conf.d/
COPY configs/identity /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf