#!/usr/bin/env bash

echo "执行统一停止脚本...";

echo "停止consul...";
consul leave

if [ -f "/var/www/html/scripts/stop.sh" ]; then
	echo "发现自定义停止脚本...";
	bash /var/www/html/scripts/stop.sh &
fi

