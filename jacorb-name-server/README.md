
本机使用

```
docker run --rm -it \
--name=jacorb-name-server \
-p 12000:12000 \
coolbeevip/jacorb-name-server:3.9
```

## 使用域名解析

客户端需要在 /etc/hosts 中配置 jacorb.server 指向本镜像的可访问地址

```
docker run --rm -it \
-p 12000:12000 \
-e JACORB_IOR_PROXY_HOST=jacorb.server \
coolbeevip/jacorb-name-server:3.9
```

## 使用域名解析 & 端口映射

客户端需要在 /etc/hosts 中配置 jacorb.server 指向本镜像的可访问地址
客户端通过 22000 访问容器对外映射的 22000 端口

```
docker run --rm -it \
-p 22000:12000 \
-e JACORB_DNS_ENABLE=on \
-e JACORB_IOR_PROXY_HOST=jacorb.server \
-e JACORB_IOR_PROXY_PORT=22000 \
coolbeevip/jacorb-name-server:3.9
```