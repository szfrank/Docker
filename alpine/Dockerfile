FROM alpine:3.4
LABEL maintainer="Frank Yu <imzhixun@gmail.com>"

RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories
RUN echo '@community http://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories
RUN echo '@testing http://mirrors.aliyun.com/alpine/edge/testing' >> /etc/apk/repositories

# 更新本地镜像及升级软件
RUN apk update && apk upgrade
# RUN apk update

#时区配置
ENV TIMEZONE Asia/Shanghai
RUN apk add tzdata \
&&  ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
&&  echo $TIMEZONE > /etc/timezone \
&&  apk del tzdata

# 容器命令执行
CMD ["sh"]
