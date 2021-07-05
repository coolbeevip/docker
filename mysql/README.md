# MySQL Docker


docker-compose.yml

```yaml
version: '3.2'
services:
  spring-beet-mariadb:
    image: coolbeevip/mysql
    hostname: mysql
    container_name: mysql
    ports:
      - '3306:3306'
    volumes:
      - ~/mydocker/docker_volume/mysql/data:/var/lib/mysql
      - ~/mydocker/docker_volume/mysql/conf:/etc/mysql/conf.d
    environment:
      - TZ=Asia/Shanghai
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=mydb
      - MYSQL_USER=mydb-user
      - MYSQL_PASSWORD=mydb-pass
```

Port

```
3306
```

Multiple Database Initialize

```properties
MYSQL_ROOT_PASSWORD=<root_password>
MYSQL_DATABASE=<dbname1>,<dbname2>
MYSQL_USER=<dbuser1>,<dbuser2>
MYSQL_PASSWORD=<dbpass1>,<dbpass2>
```

VOL

```
/app
```
