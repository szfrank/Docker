#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM frankyu/phpfpm-base

LABEL maintainer="Frank Yu <imzhixun@gmail.com>"

RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

ENV PHPREDIS_VERSION 3.1.2
RUN docker-php-source extract \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    && docker-php-source delete

RUN docker-php-source extract \
    && curl -L -o /tmp/stomp.tgz "https://pecl.php.net/get/stomp-1.0.8.tgz" \
    && mkdir -p /usr/src/php/ext/stomp \
    && tar -xvzf /tmp/stomp.tgz -C /usr/src/php/ext/stomp --strip-components=1 \
    && rm -r /tmp/stomp.tgz \
    && docker-php-ext-install stomp \
    && docker-php-source delete

RUN apk add --no-cache --virtual .build-deps \
    g++ make autoconf imagemagick-dev \
    && pecl install imagick \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable imagick \
    && apk del .build-deps \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache --virtual .build-deps \
    g++ make autoconf \
    && pecl install -o -f mongodb \
    && rm -rf /tmp/pear \
    && chmod +x /usr/local/lib/php/extensions/no-debug-non-zts-20131226/mongodb.so \
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongodb.ini \
    && apk del .build-deps \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*
