# Apache Kerby KDC server

## Run

> 把这个资源库中的 kerby-data 目录映射到容器中的 /kerby-data 卷。这个目录存储了 Kerby 的配置文件，以及管理员 keytab，和存储 principals 的 JSON 文件。

```shell
docker run --name kdc-server --rm -it -p 4000:88 -v $(pwd)/kerby-data:/kerby-data coolbeevip/kdc-server:2.0.3
```

## Creates a principal

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
KadminTool.local: ktadd -k /kerby-data/keytabs/coolbeevip.keytab -norandkey coolbeevip
Export Keytab to /kerby-data/keytabs/coolbeevip.keytab
```

## Test principal

这将为 coolbeevip 获得一个 ticket

```shell
$ export KRB5_CONFIG=/kerby-data/conf/krb5.conf
$ kinit -kt /kerby-data/keytabs/coolbeevip.keytab coolbeevip
```

使用 klist 检查 coolbeevip 的 ticket

```shell
$ klist
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: coolbeevip@EXAMPLE.COM

Valid starting       Expires              Service principal
05/28/2023 05:35:05  05/29/2023 05:35:05  krbtgt/EXAMPLE.COM@EXAMPLE.COM
	renew until 05/29/2023 05:35:05
```