#!/bin/bash
set -e

if [ $# != 1 ] ; then
    echo "befor.sh API_Proxy_IP"
    exit 1
fi

AppLogFile=$1

tail -f ${AppLogFile}

