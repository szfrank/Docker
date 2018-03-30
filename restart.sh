#!/bin/bash

# 清除已有的容器
echo 'stop phpservice container...'
docker stop phpservice
echo 'rm phpservice container...'
docker rm phpservice

# 重新生成
echo 'restart phpservice container...'
docker run --name phpservice -p 8080:80 -v /web/docker/conf/php/php.ini:/usr/local/etc/php/php.ini -v /web/docker/conf/nginx/nginx.conf:/etc/nginx/nginx.conf -v /web/docker/conf/nginx/sites-enabled:/etc/nginx/sites-enabled/ -v /web/docker/wwwroot:/var/www/html -d frankyu/phpservice
# docker run --name phpservice -p 8080:80 -d frankyu/phpservice
echo 'start php-fpm...'
docker exec -idt phpservice php-fpm
echo 'cur container ps...'
docker ps
