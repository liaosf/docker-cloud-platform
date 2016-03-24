#!/bin/bash
set -e

if [ $# != 2 ] ; then
    echo "befor.sh API_domain API_Proxy_IP"
    exit 1
fi

API_domain=$1
API_Proxy_IP=$2

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

