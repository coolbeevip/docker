# Apache Kerby KDC server

## Run

> 把这个资源库中的 kerby-data 目录映射到容器中的 /kerby-data 卷。这个目录存储了 Kerby 的配置文件，以及管理员 keytab，和存储
> principals 的 JSON 文件。

```shell
docker run -it -p 4000:88 -v \`pwd\`/kerby-data:/kerby-data coolbeevip/kdc-server:2.0.3
```

## Config KDC

> 容器运行后，你就需要连接到容器，以创建一些用于测试的 principals：

使用 `docker exec -it \<id\> bash` 命令进入容器，执行一下命令

```shell
sh bin/kadmin.sh /kerby-data/conf/ -k /kerby-data/keytabs/admin.keytab
addprinc -pw password coolbeevip@EXAMPLE.COM
```

* stty rows 24 columns 80 (required to run jline in docker)

## Test KDC

> 您可以使用 MIT 的 kinit 工具。设置 KRB5_CONFIG 环境变量，使其指向本软件仓库中包含的 "krb5.conf" 文件

```shell
export KRB5_CONFIG=\`pwd\`/krb5.conf
kinit alice
```

这将为 alice 获得一个 ticket，可以通过 klist 进行检查。