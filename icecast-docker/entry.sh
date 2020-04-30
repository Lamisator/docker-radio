#!/bin/bash

if [[ -z ${ICECAST_SOURCE_PW} ]]; then
    ICECAST_SOURCE_PW=$(tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c 16)
    echo "ICECAST_SOURCE_PW  was not set. Generated a random one."
fi


if [[ -z ${ICECAST_RELAY_PW} ]]; then
    ICECAST_RELAY_PW=$(tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c 16)
fi


if [[ -z ${ICECAST_ADMIN_PW} ]]; then
    ICECAST_ADMIN_PW=$(tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c 16)
fi

echo "ICECAST_SOURCE_PW=${ICECAST_SOURCE_PW}"

sed -i "s/<source-password>.*<\/source-password>/<source-password>${ICECAST_SOURCE_PW}<\/source-password>/g" /etc/icecast2/icecast.xml

sed -i "s/<relay-password>.*<\/relay-password>/<relay-password>${ICECAST_RELAY_PW}<\/relay-password>/g" /etc/icecast2/icecast.xml

sed -i "s/<admin-password>.*<\/admin-password>/<admin-password>${ICECAST_ADMIN_PW}<\/admin-password>/g" /etc/icecast2/icecast.xml

sudo -Eu icecast2 icecast2 -c /etc/icecast2/icecast.xml
