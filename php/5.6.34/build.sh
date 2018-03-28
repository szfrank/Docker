#!/bin/bash

# 清除已有的
docker stop phpfpm
docker rm phpfpm
docker rmi frankyu/phpfpm

# 重新生成
docker build -t frankyu/phpfpm ./
