
## 部署在本机

容器在本机启动

```
docker run \
--rm \
--name=jacorb-name-server \
-it
-p 12000:12000 \
coolbeevip/jacorb-name-server:3.9
```

## 部署在其他宿主机

容器在 10.19.88.60 服务器启动

```
docker run \
--rm \
--name=jacorb-name-server \
-it \
-p 12000:12000 \
-e JACORB_IOR_PROXY_HOST=10.19.88.60 \
coolbeevip/jacorb-name-server:3.9
```

## 部署在其他宿主机并且端口映射

容器在 10.19.88.60 服务器启动，并且将 12000 映射成 22000 端口

```
docker run \
--rm \
--name=jacorb-name-server \
-it \
-p 22000:12000 \
-e JACORB_IOR_PROXY_HOST=10.19.88.60 \
-e JACORB_IOR_PROXY_PORT=22000 \
coolbeevip/jacorb-name-server:3.9
```