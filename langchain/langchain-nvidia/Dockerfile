FROM coolbeevip/nvidia-python:12.2.0-3.11

WORKDIR /usr/app

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:/root/.cargo/bin:$PATH"
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY requirements.txt .
COPY install.sh .
RUN bash install.sh
