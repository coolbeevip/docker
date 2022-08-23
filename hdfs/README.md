# HDFS with Docker

Docker image for single HDFS node.

## Running HDFS container

```sh
# Running and get a Bash interpreter
$ docker run -p 22022:22 -p 8020:8020 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -it --rm coolbeevip/hdfs:2.8.5

# With NFS
$ docker run -p 22022:22 -p 8020:8020 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 111:111 -p 2049:2049 -it --rm coolbeevip/hdfs:2.8.5

# Running as daemon
$ docker run -p 22022:22 -p 8020:8020 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -d --rm coolbeevip/hdfs:2.8.5
```

## Environment

  - HDFS_HOST -> localhost
  - HDFS_PORT -> 8020
  - DFS_CLIENT_USE_DATANODE_HOSTNAME -> false
  - DFS_DATANODE_USE_DATANODE_HOSTNAME -> false

## Ports

  - Portmap -> `111`
  - NFS -> `2049`
  - HDFS namenode -> `8020` (hdfs://localhost:8020)
  - HDFS datanode -> `50010`
  - HDFS datanode (ipc) -> `50020`
  - HDFS Web browser -> `50070`
  - HDFS datanode (http) -> `50075`
  - HDFS secondary namenode -> `50090`
  - SSH -> `22`