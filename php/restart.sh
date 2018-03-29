#!/bin/bash

# 清除已有的容器
echo 'stop phpfpm container...'
docker stop phpfpm
echo 'rm phpfpm container...'
docker rm phpfpm

# 重新生成
echo 'restart phpfpm container...'
# docker run --name phpfpm -p 8080:80 -v /web/docker/conf/php/php.ini:/usr/local/etc/php/php.ini -v /web/docker/wwwroot:/var/www/html -d frankyu/phpfpm
docker run --name phpfpm -p 9000:9000 -d frankyu/phpfpm
echo 'cur container ps...'
docker ps
echo 'php -m:'
docker exec phpfpm php -m
