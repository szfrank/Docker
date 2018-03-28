#!/bin/bash

# 清除已有的
docker stop phpfpm-base
docker rm phpfpm-base
docker rmi frankyu/phpfpm-base

# 重新生成
docker build -t frankyu/phpfpm-base ./
