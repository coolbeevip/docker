FROM nvidia/cuda:12.2.0-base-ubuntu20.04 as builder

WORKDIR /usr/app

RUN apt-get update && \
    apt-get install -y python3-pip python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:/root/.cargo/bin:$PATH"
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY requirements.txt .
COPY install.sh .
RUN bash install.sh
