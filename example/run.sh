#!/bin/bash
set -e

API_CONF=/opt/disk2/var/www/sample/config.yaml

# adjust kernel parameters
sysctl -p

# add hosts
API_Proxy_IP_List=(`echo ${API_Proxy_IP} | tr ";" "\n"`)
if [ ${#API_Proxy_IP_List[@]} -ne 1 ]; then
    echo "==========API_Proxy_IP Has More Than One Item, Do Nothing...=========="
else
    echo "==========API_Proxy_IP Has One Item, Update The /etc/hosts...=========="
    mungehosts -a "${API_Proxy_IP}  ${API_domain}"
fi

# set config files
echo -e "\naaa_setting:\n scheme: http\n host: $API_domain\n port: 80\n" > $API_CONF
echo -e "\ncache_redis_setting:\n host: $pub_Redis\n port: 6379\n db: 0\n password: '$pub_Redis_PWD'\n" >> $API_CONF
echo -e "\nsession_redis_setting:\n host: $Atsani_Redis\n port: 6379\n db: 0\n prefix: ''\n password: '$Atsani_Redis_PWD'\n" >> $API_CONF
echo -e "\nstyle_server:\n scheme: https\n host: $Portal_domain\n" >> $API_CONF

# start server
service uwsgi restart
service nginx restart
tail -f /usr/local/nginx/logs/access.log

