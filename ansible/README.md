# 工具包

* bash
* tzdata
* openssh
* su-exec
* unzip
* libc6-compat
* libzmq
* ttf-dejavu
* curl
* shadow
* sshpass
* ansible

## ANSIBLE

### 启动并进入镜像

```
docker run --name ansible --rm -it coolbeevip/ansible /bin/bash
```

镜像内部输入以下指令可以查看 ansible 版本，并可以执行其它 ansible 指令

```
ansible --version
```

### 启动时初始化 `hosts` 配置

使用环境变量参数初始化 `hosts` 配置

```
docker run --name ansible --rm -it \
  -e ANSIBLE_SSH_HOSTS=192.168.0.1 \
  -e ANSIBLE_SSH_PORTS=22 \
  -e ANSIBLE_SSH_USERS=coolbeevip \
  -e ANSIBLE_SSH_PASSS=coolbeevip \
  -e ANSIBLE_SU_PASSS=123456 \
  coolbeevip/ansible:1.0_2.8.11-alpine \
  /bin/bash
```

进入镜像后，可以在 `/etc/ansible/hosts` 文件中看到已经初始化完毕

* ANSIBLE_SSH_HOSTS 主机地址
* ANSIBLE_SSH_PORTS SSH端口
* ANSIBLE_SSH_USERS SSH登录用户名
* ANSIBLE_SSH_PASSS SSH登录密码
* ANSIBLE_SU_PASSS SU账户密码

**注意：** 以上参数可以设置多个，使用逗号分隔，例如:

```
ANSIBLE_SSH_HOSTS=192.168.0.1,192.168.0.2
ANSIBLE_SSH_PORTS=22,22
ANSIBLE_SSH_USERS=user1,user2
ANSIBLE_SSH_PASSS=pass1,pass2
ANSIBLE_SU_PASSS=supass1,supass2
```

**注意：** 如果您的参数值中包含逗号，那么您可以使用 ANSIBLE_PARAM_SPLIT 参数自定义分隔符，例如

```
ANSIBLE_PARAM_SPLIT=#
ANSIBLE_SSH_HOSTS=192.168.0.1#192.168.0.2
ANSIBLE_SSH_PORTS=22#22
ANSIBLE_SSH_USERS=user1#user2
ANSIBLE_SSH_PASSS=pass1#pass2
ANSIBLE_SU_PASSS=supass1#supass2
```

**注意：** 如果您的参数值中包含逗号，那么您可以使用 ANSIBLE_PARAM_SPLIT 参数自定义分隔符，例如

```
ANSIBLE_PARAM_SPLIT=";"
ANSIBLE_SSH_HOSTS="192.168.0.1;192.168.0.2"
ANSIBLE_SSH_PORTS="22;22"
ANSIBLE_SSH_USERS="user1;user2"
ANSIBLE_SSH_PASSS="pass1;pass2"
ANSIBLE_SU_PASSS="supass1;supass2"
```

### 在外部卷中定义配置

你可以在容器外部定义 `hosts` 和 `ansible.cfg` 文件，并使用卷映射到容器内部

```
docker run --name ansible --rm -it \
  -v ./volume/ansible:/etc/ansible \
  coolbeevip/ansible:1.0_2.8.11-alpine \
  /bin/bash
```

### root 权限

```
ansible 192.168.0.1 --become --become-user root --become-method su -a 'docker ps'
```
