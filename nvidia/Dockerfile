FROM nvidia/cuda:12.2.0-base-ubuntu20.04

# 设置环境变量以实现非交互式安装
ENV DEBIAN_FRONTEND=noninteractive
# 默认的时区设置
ENV TZ=Asia/Shanghai

# Install Python
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11 python3.11-dev python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 && \
    update-alternatives --config python3 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.11 2 && \
    update-alternatives --config python