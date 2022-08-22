# HDFS with Docker

Docker image for single HDFS node.

**Only for development purpose.**

License: **MIT**

## Local build
```sh
$ docker build -t coolbeevip/hdfs .
```

## Running HDFS container

```sh
# Running and get a Bash interpreter
$ docker run -p 22022:22 -p 8020:8020 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -it --rm coolbeevip/hdfs:2.7.7

# With NFS
$ docker run -p 22022:22 -p 8020:8020 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 111:111 -p 2049:2049 -it --rm coolbeevip/hdfs:2.7.7

# Running as daemon
$ docker run -p 22022:22 -p 8020:8020 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -d --rm coolbeevip/hdfs:2.7.7
```

- Ports
  - Portmap -> `111`
  - NFS -> `2049`
  - HDFS namenode -> `8020` (hdfs://localhost:8020)
  - HDFS datanode -> `50010`
  - HDFS datanode (ipc) -> `50020`
  - HDFS Web browser -> `50070`
  - HDFS datanode (http) -> `50075`
  - HDFS secondary namenode -> `50090`
  - SSH -> `22`


## Contributing

All PRs are welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
