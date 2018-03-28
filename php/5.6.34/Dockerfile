FROM php-base-dazong
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
