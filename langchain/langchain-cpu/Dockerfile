FROM python:3.11-buster as builder

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY requirements.txt .
COPY install.sh .
RUN bash install.sh
