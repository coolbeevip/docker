#!/bin/sh

if [ "$REDIS_PASSWORD" != "" ]; then
  echo "init redis password"
  echo -e "\nrequirepass $REDIS_PASSWORD" >> /redis/redis.conf

  if [ $CLUSTER_ANNOUNCE_IP ]; then
    echo -e "\nmasterauth $REDIS_PASSWORD" >> /redis/redis.conf
  fi
fi

if [ "$REDIS_MAXMEMORY" != "" ]; then
  echo "init redis maxmemory"
  sed -i -r "s/^(maxmemory .*)$/\1\nmaxmemory $REDIS_MAXMEMORY/" /redis/redis.conf
fi

if [ "$REDIS_PORT" != "" ]; then
  echo "init redis port"
  sed -i "s/port 6379/port $REDIS_PORT/g" /redis/redis.conf
fi

if [ $CLUSTER_ANNOUNCE_IP ]; then
  sed -i "s/cluster-enabled no/cluster-enabled yes/g" /redis/redis.conf
  sed -i "s/cluster-announce-ip 127.0.0.1/cluster-announce-ip $CLUSTER_ANNOUNCE_IP/g" /redis/redis.conf
fi

if [ $CLUSTER_ANNOUNCE_PORT ]; then
    sed -i "s/cluster-announce-port 6379/cluster-announce-port $CLUSTER_ANNOUNCE_PORT/g" /redis/redis.conf
fi

if [ $CLUSTER_ANNOUNCE_BUS_PORT ]; then
    sed -i "s/cluster-announce-bus-port 16379/cluster-announce-bus-port $CLUSTER_ANNOUNCE_BUS_PORT/g" /redis/redis.conf
fi
