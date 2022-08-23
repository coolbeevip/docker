#!/usr/bin/env bash

host=${HDFS_HOST:-localhost}
port=${HDFS_PORT:-8020}
ssh_port=${SSH_PORT:-22}
dfs_client_use_datanode_hostname=${DFS_CLIENT_USE_DATANODE_HOSTNAME:-false}
dfs_datanode_use_datanode_hostname=${DFS_DATANODE_USE_DATANODE_HOSTNAME:-false}

export HADOOP_SSH_OPTS="-p ${ssh_port}"

init_config() {
    cp -f /opt/hadoop/etc/hadoop/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml.template
    sed -i -e "s/HDFS_HOST/$host/" /opt/hadoop/etc/hadoop/core-site.xml
    sed -i -e "s/HDFS_PORT/$port/" /opt/hadoop/etc/hadoop/core-site.xml
    sed -i -e "s/#Port 22/Port $ssh_port/" /etc/ssh/sshd_config

    sed -i -e "s/DFS_CLIENT_USE_DATANODE_HOSTNAME/$dfs_client_use_datanode_hostname/" /opt/hadoop/etc/hadoop/hdfs-site.xml
    sed -i -e "s/DFS_DATANODE_USE_DATANODE_HOSTNAME/$dfs_datanode_use_datanode_hostname/" /opt/hadoop/etc/hadoop/hdfs-site.xml

    ssh-keygen -t rsa -b 1024 -f /root/.ssh/id_rsa -N ""
    cp -v /root/.ssh/{id_rsa.pub,authorized_keys}
    chmod -v 0400 /root/.ssh/authorized_keys
}

echo "Starting HDFS on ${host}:${port}"
init_config

echo "Starting SSH on ${host}:${ssh_port}"
service ssh start
until nc -vzw 2 $host ${ssh_port}; do sleep 2; done

echo "Starting DFS"
start-dfs.sh

echo "Starting HADOOP PORT MAP"
hadoop-daemon.sh start portmap

echo "Starting HADOOP NFS3"
hadoop-daemon.sh start nfs3

echo "CRATE DFS /DATA"
hdfs dfs -mkdir /DATA

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi

if [[ $1 == "-d" ]]; then
  tail -f /dev/null /opt/hadoop/logs/*
fi
