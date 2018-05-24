#!/bin/bash

# 清除已有的
docker stop phpservice
docker rm phpservice
docker rmi frankyu/phpservice

# 重新生成
docker login -u admin -p 123123 172.16.21.52:5000
docker build -t frankyu/phpservice .
docker build -t 172.16.21.52:5000/phpservice .
docker push 172.16.21.52:5000/phpservice
