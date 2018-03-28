# Docker
# How to build

## Alpine:
1. **Alpine用阿里云镜像**
```
cd alpine && bash build.sh
```

## Nginx
1. **Nginx增加图片剪切模块**
```
cd nginx && bash build.sh
```

## PHP:
1. **构建PHP内置模块，包含以下扩展:**
```
cd php/5.6.34/bash && bash build.sh
```

1. **构建Composer、Redis、MongoDB、Stomp模块及扩展**
```
cd php/5.6.34 && bash build.sh
```

# How to run
```
docker run -d -v /var/www/html:/var/www/html -p 9000:9000 --name phpfpm frankyu/phpfpm:latest
```
