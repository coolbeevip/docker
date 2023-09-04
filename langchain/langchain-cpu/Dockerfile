FROM python:3.9-buster as builder

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"
COPY requirements.txt .
COPY install.sh .
RUN bash install.sh
