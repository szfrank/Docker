#!/bin/bash

# 清除已有的
docker stop phpservice
docker rm phpservice
docker rmi frankyu/phpservice

# 重新生成
docker build -t frankyu/phpservice ./
