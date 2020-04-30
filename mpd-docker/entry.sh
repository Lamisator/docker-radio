#!/bin/bash

#if [[ -z ${ICECAST_PORT_8000_TCP_ADDR} ]]; then
#    echo "Container not linked to icecast container. Quitting"
#    exit 1
#fi

if [[ -z ${STREAM_NAME} ]]; then
    STREAM_NAME="My Stream"
    echo "STREAM_NAME env not set; Defaulting to: My Stream"
fi

if [[ -z ${STREAM_PORT} ]]; then
    STREAM_PORT=8000
    echo "STREAM_PORT env not set; Defaulting to: 8000"
fi

if [[ -z ${STREAM_MOUNT_POINT} ]]; then
    STREAM_MOUNT_POINT="mystream.mp3"
    echo "STREAM_MOUNT_POINT env not set; Defaulting to: mystream.mp3"
fi

if [[ -z ${STREAM_PASSWORD} ]]; then
    STREAM_PASSWORD="hackme"
    echo "STREAM_PASSWORD env not set; Defaulting to: hackme"
fi


sed -i "s/<streamnameplaceholder>/${STREAM_NAME}/g" /etc/mpd.conf
sed -i "s/<portplaceholder>/${STREAM_PORT}/g" /etc/mpd.conf
sed -i "s/<mountpointplaceholder>/${STREAM_MOUNT_POINT}/g" /etc/mpd.conf
sed -i "s/<passwordplaceholder>/${STREAM_PASSWORD}/g" /etc/mpd.conf
sed -i "s/<encodingplaceholder>/${STREAM_ENCODING}/g" /etc/mpd.conf
sed -i "s/<bitrateplaceholder>/${STREAM_BITRATE}/g" /etc/mpd.conf
mpd --no-daemon --stderr
