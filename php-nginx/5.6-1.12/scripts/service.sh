#!/bin/bash
if [ $1 = 'start' ]; then
echo 'start nginx...';
/usr/sbin/nginx
echo 'cur nginx';
ps aux | grep nginx
echo 'start php-fpm...';
/usr/local/sbin/php-fpm &
echo 'cur php-fpm';
ps aux | grep php-fpm
elif [ $1 = 'stop' ]; then
echo 'cur php-fpm';
ps aux | grep php-fpm
echo 'stop services...';
pkill -f php-fpm
ps aux | grep php-fpm
pkill -f nginx
fi
