#!/bin/sh

if [ ! -d /redis/data ]; then
    mkdir -p /redis/data
fi

if [ ! -f "/redis/redis.conf" ]; then
    cp /tmp/redis.conf /redis/redis.conf
    sh /conf_script.sh
fi

exec redis-server /redis/redis.conf
