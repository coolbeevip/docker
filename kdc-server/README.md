# Apache Kerby KDC server

## Run

> 把这个资源库中的 kerby-data 目录映射到容器中的 /kerby-data 卷。这个目录存储了 Kerby 的配置文件，以及管理员 keytab，和存储 principals 的 JSON 文件。

```shell
docker run -it -p 4000:88 -v \`pwd\`/kerby-data:/kerby-data coolbeevip/kdc-server:2.0.3
```

## Creates the principal

使用 `docker exec -it \<id\> bash` 命令进入容器，执行 `bin/kadmin.sh /kerby-data/conf/ -k /kerby-data/keytabs/admin.keytab` 命令
进入管理界面，输入 `addprinc -pw password coolbeevip@EXAMPLE.COM` 命令增加一个用户

```shell
$ bin/kadmin.sh /kerby-data/conf/ -k /kerby-data/keytabs/admin.keytab
Debug is  true storeKey true useTicketCache false useKeyTab true doNotPrompt true ticketCache is null isInitiator true KeyTab is /kerby-data/keytabs/admin.keytab refreshKrb5Config is true principal is kadmin/EXAMPLE.COM@EXAMPLE.COM tryFirstPass is false useFirstPass is false storePass is false clearPass is false
Refreshing Kerberos configuration
principal is kadmin/EXAMPLE.COM@EXAMPLE.COM
Will use keytab
Commit Succeeded

KadminTool.local: addprinc -pw password coolbeevip@EXAMPLE.COM
Principal "coolbeevip@EXAMPLE.COM" created.
KadminTool.local:
```

* stty rows 24 columns 80 (required to run jline in docker)

## Test KDC

> 您可以使用 MIT 的 kinit 工具。设置 KRB5_CONFIG 环境变量，使其指向本软件仓库中包含的 "krb5.conf" 文件

```shell
export KRB5_CONFIG=/kerby-data/conf/krb5.conf
kinit coolbeevip
```

这将为 alice 获得一个 ticket，可以通过 klist 进行检查。