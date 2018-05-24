#!/bin/bash
if   [  -z $consul_datacenter   ];
then
export consul_datacenter='dc1'
fi

crond

bash /var/www/html/scripts/service.sh start

# consul ....
consul agent -retry-join "consul.service.dazong.com" -client "0.0.0.0" -data-dir /var/www/html/consul/ -datacenter "$consul_datacenter" -config-file=/var/www/html/scripts/consul.json &

#监听停止事件
trap 'bash /var/www/html/scripts/shutdown.sh' 15;

wait $!
